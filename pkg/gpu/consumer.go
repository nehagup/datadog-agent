// Unless explicitly stated otherwise all files in this repository are licensed
// under the Apache License Version 2.0.
// This product includes software developed at Datadog (https://www.datadoghq.com/).
// Copyright 2024-present Datadog, Inc.

//go:build linux_bpf

package gpu

import (
	"fmt"
	"sync"
	"sync/atomic"
	"time"
	"unsafe"

	"github.com/NVIDIA/go-nvml/pkg/nvml"
	"golang.org/x/sys/unix"

	"github.com/DataDog/datadog-agent/comp/core/telemetry"
	ddebpf "github.com/DataDog/datadog-agent/pkg/ebpf"
	"github.com/DataDog/datadog-agent/pkg/gpu/config"
	gpuebpf "github.com/DataDog/datadog-agent/pkg/gpu/ebpf"
	"github.com/DataDog/datadog-agent/pkg/process/monitor"
	"github.com/DataDog/datadog-agent/pkg/status/health"
	"github.com/DataDog/datadog-agent/pkg/util/cgroups"
	"github.com/DataDog/datadog-agent/pkg/util/kernel"
	"github.com/DataDog/datadog-agent/pkg/util/log"
)

const telemetryEventErrorMismatch = "size_mismatch"
const telemetryEventErrorUnknownType = "unknown_type"
const telemetryEventTypeUnknown = "unknown"
const telemetryEventHeader = "header"

// cudaEventConsumer is responsible for consuming CUDA events from the eBPF probe, and delivering them
// to the appropriate stream handler.
type cudaEventConsumer struct {
	eventHandler   ddebpf.EventHandler
	once           sync.Once
	closed         chan struct{}
	streamHandlers map[streamKey]*StreamHandler
	wg             sync.WaitGroup
	running        atomic.Bool
	sysCtx         *systemContext
	cfg            *config.Config
	telemetry      *cudaEventConsumerTelemetry
}

type cudaEventConsumerTelemetry struct {
	activeHandlers     telemetry.Gauge
	removedHandlers    telemetry.Counter
	events             telemetry.Counter
	eventErrors        telemetry.Counter
	finalizedProcesses telemetry.Counter
	missingContainers  telemetry.Counter
	missingDevices     telemetry.Counter
}

// newCudaEventConsumer creates a new CUDA event consumer.
func newCudaEventConsumer(sysCtx *systemContext, eventHandler ddebpf.EventHandler, cfg *config.Config, telemetry telemetry.Component) *cudaEventConsumer {
	return &cudaEventConsumer{
		eventHandler:   eventHandler,
		closed:         make(chan struct{}),
		streamHandlers: make(map[streamKey]*StreamHandler),
		cfg:            cfg,
		sysCtx:         sysCtx,
		telemetry:      newCudaEventConsumerTelemetry(telemetry),
	}
}

func newCudaEventConsumerTelemetry(tm telemetry.Component) *cudaEventConsumerTelemetry {
	subsystem := gpuTelemetryModule + "__consumer"

	return &cudaEventConsumerTelemetry{
		activeHandlers:     tm.NewGauge(subsystem, "active_handlers", nil, "Number of active stream handlers"),
		removedHandlers:    tm.NewCounter(subsystem, "removed_handlers", nil, "Number of removed stream handlers"),
		events:             tm.NewCounter(subsystem, "events", []string{"event_type"}, "Number of processed CUDA events received by the consumer"),
		eventErrors:        tm.NewCounter(subsystem, "events__errors", []string{"event_type", "error"}, "Number of CUDA events that couldn't be processed due to an error"),
		finalizedProcesses: tm.NewCounter(subsystem, "finalized_processes", nil, "Number of finalized processes"),
		missingContainers:  tm.NewCounter(subsystem, "missing_containers", []string{"reason"}, "Number of missing containers"),
		missingDevices:     tm.NewCounter(subsystem, "missing_devices", nil, "Number of failures to get GPU devices for a stream"),
	}
}

// Stop stops the CUDA event consumer.
func (c *cudaEventConsumer) Stop() {
	if c == nil {
		return
	}
	c.once.Do(func() {
		close(c.closed)
	})
	c.wg.Wait()
}

// Start starts the CUDA event consumer.
func (c *cudaEventConsumer) Start() {
	if c == nil {
		return
	}
	health := health.RegisterLiveness("gpu-tracer-cuda-events")
	processMonitor := monitor.GetProcessMonitor()
	cleanupExit := processMonitor.SubscribeExit(c.handleProcessExit)

	c.wg.Add(1)
	go func() {
		c.running.Store(true)
		processSync := time.NewTicker(c.cfg.ScanProcessesInterval)

		defer func() {
			cleanupExit()
			err := health.Deregister()
			if err != nil {
				log.Warnf("error de-registering health check: %s", err)
			}
			c.wg.Done()
			log.Trace("CUDA event consumer stopped")
			c.running.Store(false)
		}()

		dataChannel := c.eventHandler.DataChannel()
		lostChannel := c.eventHandler.LostChannel()
		for {
			select {
			case <-c.closed:
				return
			case <-health.C:
			case <-processSync.C:
				c.checkClosedProcesses()
				c.sysCtx.cleanupOldEntries()
			case batchData, ok := <-dataChannel:
				if !ok {
					return
				}

				dataLen := len(batchData.Data)
				if dataLen < gpuebpf.SizeofCudaEventHeader {
					log.Errorf("Not enough data to parse header, data size=%d, expecting at least %d", dataLen, gpuebpf.SizeofCudaEventHeader)
					c.telemetry.eventErrors.Inc(telemetryEventHeader, telemetryEventErrorMismatch)
					continue
				}

				header := (*gpuebpf.CudaEventHeader)(unsafe.Pointer(&batchData.Data[0]))
				dataPtr := unsafe.Pointer(&batchData.Data[0])

				var err error
				eventType := gpuebpf.CudaEventType(header.Type)
				c.telemetry.events.Inc(eventType.String())
				if isStreamSpecificEvent(eventType) {
					err = c.handleStreamEvent(header, dataPtr, dataLen)
				} else {
					err = c.handleGlobalEvent(header, dataPtr, dataLen)
				}

				if err != nil {
					log.Errorf("Error processing CUDA event: %v", err)
				}

				batchData.Done()
			// lost events only occur when using perf buffers
			case _, ok := <-lostChannel:
				if !ok {
					return
				}
			}
		}
	}()
	log.Trace("CUDA event consumer started")
}

func isStreamSpecificEvent(eventType gpuebpf.CudaEventType) bool {
	return eventType != gpuebpf.CudaEventTypeSetDevice
}

func (c *cudaEventConsumer) handleStreamEvent(header *gpuebpf.CudaEventHeader, data unsafe.Pointer, dataLen int) error {
	streamHandler := c.getStreamHandler(header)
	eventType := gpuebpf.CudaEventType(header.Type)

	switch eventType {
	case gpuebpf.CudaEventTypeKernelLaunch:
		if dataLen != gpuebpf.SizeofCudaKernelLaunch {
			c.telemetry.eventErrors.Inc(eventType.String(), telemetryEventErrorMismatch)
			return fmt.Errorf("Not enough data to parse kernel launch event, data size=%d, expecting %d", dataLen, gpuebpf.SizeofCudaKernelLaunch)
		}
		streamHandler.handleKernelLaunch((*gpuebpf.CudaKernelLaunch)(data))
	case gpuebpf.CudaEventTypeMemory:
		if dataLen != gpuebpf.SizeofCudaMemEvent {
			c.telemetry.eventErrors.Inc(eventType.String(), telemetryEventErrorMismatch)
			return fmt.Errorf("Not enough data to parse memory event, data size=%d, expecting %d", dataLen, gpuebpf.SizeofCudaMemEvent)
		}
		streamHandler.handleMemEvent((*gpuebpf.CudaMemEvent)(data))
	case gpuebpf.CudaEventTypeSync:
		if dataLen != gpuebpf.SizeofCudaSync {
			c.telemetry.eventErrors.Inc(eventType.String(), telemetryEventErrorMismatch)
			return fmt.Errorf("Not enough data to parse sync event, data size=%d, expecting %d", dataLen, gpuebpf.SizeofCudaSync)
		}
		streamHandler.handleSync((*gpuebpf.CudaSync)(data))
	default:
		c.telemetry.eventErrors.Inc(telemetryEventTypeUnknown, telemetryEventErrorUnknownType)
		return fmt.Errorf("Unknown event type: %d", header.Type)
	}

	return nil
}

func getPidTidFromHeader(header *gpuebpf.CudaEventHeader) (uint32, uint32) {
	tid := uint32(header.Pid_tgid & 0xFFFFFFFF)
	pid := uint32(header.Pid_tgid >> 32)
	return pid, tid
}

func (c *cudaEventConsumer) handleGlobalEvent(header *gpuebpf.CudaEventHeader, data unsafe.Pointer, dataLen int) error {
	eventType := gpuebpf.CudaEventType(header.Type)
	switch eventType {
	case gpuebpf.CudaEventTypeSetDevice:
		if dataLen != gpuebpf.SizeofCudaSetDeviceEvent {
			c.telemetry.eventErrors.Inc(eventType.String(), telemetryEventErrorMismatch)
			return fmt.Errorf("Not enough data to parse set device event, data size=%d, expecting %d", dataLen, gpuebpf.SizeofCudaSetDeviceEvent)
		}
		csde := (*gpuebpf.CudaSetDeviceEvent)(data)

		pid, tid := getPidTidFromHeader(header)
		c.sysCtx.setDeviceSelection(int(pid), int(tid), csde.Device)
	default:
		c.telemetry.eventErrors.Inc(telemetryEventTypeUnknown, telemetryEventErrorUnknownType)
		return fmt.Errorf("Unknown event type: %d", header.Type)
	}

	return nil
}

func (c *cudaEventConsumer) handleProcessExit(pid uint32) {
	for key, handler := range c.streamHandlers {
		if key.pid == pid {
			log.Debugf("Process %d ended, marking stream %d as ended", pid, key.stream)
			// the probe is responsible for deleting the stream handler
			_ = handler.markEnd()
			c.telemetry.finalizedProcesses.Inc()
		}
	}
}

func (c *cudaEventConsumer) getStreamKey(header *gpuebpf.CudaEventHeader) streamKey {
	pid, tid := getPidTidFromHeader(header)

	cgroup := unix.ByteSliceToString(header.Cgroup[:])
	containerID, err := cgroups.ContainerFilter("", cgroup)
	if err != nil {
		// We don't want to return an error here, as we can still process the event without the container ID
		log.Warnf("error getting container ID for cgroup %s: %s", cgroup, err)
		c.telemetry.missingContainers.Inc("error")
	} else if containerID == "" {
		c.telemetry.missingContainers.Inc("missing")
	}

	key := streamKey{
		pid:         pid,
		stream:      header.Stream_id,
		gpuUUID:     "",
		containerID: containerID,
	}

	// Try to get the GPU device if we can, but do not fail if we can't as we want to report
	// the data even if we can't get the GPU UUID
	gpuDevice, err := c.sysCtx.getCurrentActiveGpuDevice(int(pid), int(tid), containerID)
	if err != nil {
		log.Warnf("Error getting GPU device for process %d: %v", pid, err)
		c.telemetry.missingDevices.Inc()
	} else {
		var ret nvml.Return
		key.gpuUUID, ret = gpuDevice.GetUUID()
		if ret != nvml.SUCCESS {
			log.Warnf("Error getting GPU UUID for process %d: %v", pid, nvml.ErrorString(ret))
		}
	}

	return key
}

func (c *cudaEventConsumer) getStreamHandler(header *gpuebpf.CudaEventHeader) *StreamHandler {
	key := c.getStreamKey(header)
	if _, ok := c.streamHandlers[key]; !ok {
		c.streamHandlers[key] = newStreamHandler(key.pid, key.containerID, c.sysCtx)
		c.telemetry.activeHandlers.Set(float64(len(c.streamHandlers)))
	}

	return c.streamHandlers[key]
}

func (c *cudaEventConsumer) checkClosedProcesses() {
	seenPIDs := make(map[uint32]struct{})
	_ = kernel.WithAllProcs(c.cfg.ProcRoot, func(pid int) error {
		seenPIDs[uint32(pid)] = struct{}{}
		return nil
	})

	for key, handler := range c.streamHandlers {
		if _, ok := seenPIDs[key.pid]; !ok {
			log.Debugf("Process %d ended, marking stream %d as ended", key.pid, key.stream)
			_ = handler.markEnd()
		}
	}
}

func (c *cudaEventConsumer) cleanFinishedHandlers() {
	for key, handler := range c.streamHandlers {
		if handler.processEnded {
			delete(c.streamHandlers, key)
		}
	}

	c.telemetry.activeHandlers.Set(float64(len(c.streamHandlers)))
}
