module github.com/DataDog/datadog-agent/pkg/serializer

go 1.22.0

replace (
	github.com/DataDog/datadog-agent/comp/api/api/def => ../../comp/api/api/def
	github.com/DataDog/datadog-agent/comp/core/config => ../../comp/core/config
	github.com/DataDog/datadog-agent/comp/core/flare/builder => ../../comp/core/flare/builder
	github.com/DataDog/datadog-agent/comp/core/flare/types => ../../comp/core/flare/types
	github.com/DataDog/datadog-agent/comp/core/log/def => ../../comp/core/log/def
	github.com/DataDog/datadog-agent/comp/core/log/mock => ../../comp/core/log/mock
	github.com/DataDog/datadog-agent/comp/core/secrets => ../../comp/core/secrets
	github.com/DataDog/datadog-agent/comp/core/status => ../../comp/core/status
	github.com/DataDog/datadog-agent/comp/core/tagger/origindetection => ../../comp/core/tagger/origindetection
	github.com/DataDog/datadog-agent/comp/core/telemetry => ../../comp/core/telemetry
	github.com/DataDog/datadog-agent/comp/def => ../../comp/def
	github.com/DataDog/datadog-agent/comp/forwarder/defaultforwarder => ../../comp/forwarder/defaultforwarder
	github.com/DataDog/datadog-agent/comp/forwarder/orchestrator/orchestratorinterface => ../../comp/forwarder/orchestrator/orchestratorinterface
	github.com/DataDog/datadog-agent/comp/serializer/metricscompression => ../../comp/serializer/metricscompression
	github.com/DataDog/datadog-agent/pkg/aggregator/ckey => ../aggregator/ckey
	github.com/DataDog/datadog-agent/pkg/api => ../api
	github.com/DataDog/datadog-agent/pkg/collector/check/defaults => ../collector/check/defaults
	github.com/DataDog/datadog-agent/pkg/config/env => ../config/env
	github.com/DataDog/datadog-agent/pkg/config/logs => ../config/logs/
	github.com/DataDog/datadog-agent/pkg/config/mock => ../config/mock
	github.com/DataDog/datadog-agent/pkg/config/model => ../config/model
	github.com/DataDog/datadog-agent/pkg/config/nodetreemodel => ../../pkg/config/nodetreemodel
	github.com/DataDog/datadog-agent/pkg/config/setup => ../config/setup/
	github.com/DataDog/datadog-agent/pkg/config/structure => ../../pkg/config/structure
	github.com/DataDog/datadog-agent/pkg/config/teeconfig => ../../pkg/config/teeconfig
	github.com/DataDog/datadog-agent/pkg/config/utils => ../config/utils/
	github.com/DataDog/datadog-agent/pkg/metrics => ../metrics/
	github.com/DataDog/datadog-agent/pkg/obfuscate => ../obfuscate
	github.com/DataDog/datadog-agent/pkg/orchestrator/model => ../orchestrator/model/
	github.com/DataDog/datadog-agent/pkg/process/util/api => ../process/util/api
	github.com/DataDog/datadog-agent/pkg/proto => ../proto
	github.com/DataDog/datadog-agent/pkg/remoteconfig/state => ../remoteconfig/state/
	github.com/DataDog/datadog-agent/pkg/status/health => ../status/health
	github.com/DataDog/datadog-agent/pkg/tagger/types => ../tagger/types/
	github.com/DataDog/datadog-agent/pkg/tagset => ../tagset
	github.com/DataDog/datadog-agent/pkg/telemetry => ../telemetry
	github.com/DataDog/datadog-agent/pkg/trace => ../trace
	github.com/DataDog/datadog-agent/pkg/util/backoff => ../util/backoff/
	github.com/DataDog/datadog-agent/pkg/util/buf => ../util/buf/
	github.com/DataDog/datadog-agent/pkg/util/common => ../util/common
	github.com/DataDog/datadog-agent/pkg/util/compression => ../util/compression
	github.com/DataDog/datadog-agent/pkg/util/defaultpaths => ../../pkg/util/defaultpaths
	github.com/DataDog/datadog-agent/pkg/util/executable => ../util/executable/
	github.com/DataDog/datadog-agent/pkg/util/filesystem => ../util/filesystem/
	github.com/DataDog/datadog-agent/pkg/util/fxutil => ../util/fxutil/
	github.com/DataDog/datadog-agent/pkg/util/hostname/validate => ../util/hostname/validate
	github.com/DataDog/datadog-agent/pkg/util/http => ../util/http
	github.com/DataDog/datadog-agent/pkg/util/json => ../util/json
	github.com/DataDog/datadog-agent/pkg/util/log => ../util/log
	github.com/DataDog/datadog-agent/pkg/util/log/setup => ../util/log/setup
	github.com/DataDog/datadog-agent/pkg/util/option => ../util/option/
	github.com/DataDog/datadog-agent/pkg/util/pointer => ../util/pointer
	github.com/DataDog/datadog-agent/pkg/util/scrubber => ../util/scrubber/
	github.com/DataDog/datadog-agent/pkg/util/sort => ../util/sort/
	github.com/DataDog/datadog-agent/pkg/util/system => ../util/system
	github.com/DataDog/datadog-agent/pkg/util/system/socket => ../util/system/socket/
	github.com/DataDog/datadog-agent/pkg/util/testutil => ../util/testutil/
	github.com/DataDog/datadog-agent/pkg/util/winutil => ../util/winutil/
	github.com/DataDog/datadog-agent/pkg/version => ../version/
)

require (
	github.com/DataDog/agent-payload/v5 v5.0.143
	github.com/DataDog/datadog-agent/comp/core/config v0.64.0-devel
	github.com/DataDog/datadog-agent/comp/forwarder/defaultforwarder v0.56.0-rc.3
	github.com/DataDog/datadog-agent/comp/forwarder/orchestrator/orchestratorinterface v0.56.0-rc.3
	github.com/DataDog/datadog-agent/comp/serializer/metricscompression v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/aggregator/ckey v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/config/mock v0.59.0
	github.com/DataDog/datadog-agent/pkg/config/model v0.64.0-devel
	github.com/DataDog/datadog-agent/pkg/metrics v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/process/util/api v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/tagger/types v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/tagset v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/telemetry v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/util/compression v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/util/json v0.56.0-rc.3
	github.com/DataDog/datadog-agent/pkg/util/log v0.60.1
	github.com/DataDog/datadog-agent/pkg/version v0.59.1
	github.com/DataDog/opentelemetry-mapping-go/pkg/quantile v0.25.0
	github.com/gogo/protobuf v1.3.2
	github.com/json-iterator/go v1.1.12
	github.com/protocolbuffers/protoscope v0.0.0-20221109213918-8e7a6aafa2c9
	github.com/richardartoul/molecule v1.0.1-0.20240531184615-7ca0df43c0b3
	github.com/stretchr/testify v1.10.0
	google.golang.org/protobuf v1.36.4
)

require (
	github.com/DataDog/datadog-agent/comp/core/flare/builder v0.59.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/flare/types v0.59.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/log/def v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/comp/core/secrets v0.59.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/status v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/origindetection v0.62.0-rc.1 // indirect
	github.com/DataDog/datadog-agent/comp/core/telemetry v0.60.1 // indirect
	github.com/DataDog/datadog-agent/comp/def v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/api v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/collector/check/defaults v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/env v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/nodetreemodel v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/setup v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/structure v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/teeconfig v0.60.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/utils v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/orchestrator/model v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/status/health v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/backoff v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/buf v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/common v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/executable v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/filesystem v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/fxutil v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/hostname/validate v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/http v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/option v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/util/pointer v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/scrubber v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/sort v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system/socket v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/winutil v0.60.1 // indirect
	github.com/DataDog/mmh3 v0.0.0-20210722141835-012dc69a9e49 // indirect
	github.com/DataDog/sketches-go v1.4.6 // indirect
	github.com/DataDog/viper v1.14.0 // indirect
	github.com/DataDog/zstd v1.5.6 // indirect
	github.com/DataDog/zstd_0 v0.0.0-20210310093942-586c1286621f // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cihub/seelog v0.0.0-20170130134532-f561c5e57575 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/ebitengine/purego v0.8.1 // indirect
	github.com/fatih/color v1.18.0 // indirect
	github.com/fsnotify/fsnotify v1.8.0 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
	github.com/hectane/go-acl v0.0.0-20230122075934-ca0b05cb1adb // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
	github.com/klauspost/compress v1.17.11 // indirect
	github.com/lufia/plan9stats v0.0.0-20240226150601-1dcf7310316a // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mitchellh/mapstructure v1.5.1-0.20231216201459-8508981c8b6c // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
	github.com/pelletier/go-toml v1.9.5 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/power-devops/perfstat v0.0.0-20240221224432-82ca36839d55 // indirect
	github.com/prometheus/client_golang v1.20.5 // indirect
	github.com/prometheus/client_model v0.6.1 // indirect
	github.com/prometheus/common v0.62.0 // indirect
	github.com/prometheus/procfs v0.15.1 // indirect
	github.com/shirou/gopsutil/v4 v4.24.12 // indirect
	github.com/spf13/afero v1.11.0 // indirect
	github.com/spf13/cast v1.7.1 // indirect
	github.com/spf13/cobra v1.8.1 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/stretchr/objx v0.5.2 // indirect
	github.com/tklauser/go-sysconf v0.3.14 // indirect
	github.com/tklauser/numcpus v0.8.0 // indirect
	github.com/twmb/murmur3 v1.1.8 // indirect
	github.com/yusufpapurcu/wmi v1.2.4 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.uber.org/dig v1.18.0 // indirect
	go.uber.org/fx v1.23.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.27.0 // indirect
	golang.org/x/exp v0.0.0-20250128182459-e0ece0dbea4c // indirect
	golang.org/x/net v0.34.0 // indirect
	golang.org/x/sys v0.29.0 // indirect
	golang.org/x/text v0.21.0 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
