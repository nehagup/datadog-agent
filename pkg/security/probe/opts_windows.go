// Unless explicitly stated otherwise all files in this repository are licensed
// under the Apache License Version 2.0.
// This product includes software developed at Datadog (https://www.datadoghq.com/).
// Copyright 2016-present Datadog, Inc.

//go:build windows

// Package probe holds probe related files
package probe

import (
	"github.com/DataDog/datadog-agent/pkg/security/resolvers/tags"
	"github.com/DataDog/datadog-go/v5/statsd"
)

// Opts defines some probe options
type Opts struct {
	// DontDiscardRuntime do not discard the runtime. Mostly used by functional tests
	DontDiscardRuntime bool

	// StatsdClient to be used for probe stats
	StatsdClient statsd.ClientInterface

	// EnvsVarResolutionEnabled defines if environment variables resolution is enabled
	EnvsVarResolutionEnabled bool

	// Tagger will override the default one. Mainly here for tests.
	Tagger tags.Tagger

	// this option for test purposes only; should never be true in main code
	disableProcmon bool
}

func (o *Opts) normalize() {
	if o.StatsdClient == nil {
		o.StatsdClient = &statsd.NoOpClient{}
	}
}
