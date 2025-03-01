module github.com/DataDog/datadog-agent/comp/core/tagger/fx-remote

go 1.22.0

toolchain go1.23.3

require (
	github.com/DataDog/datadog-agent/comp/core/tagger/def v0.0.0-20250129172314-517df3f51a84
	github.com/DataDog/datadog-agent/comp/core/tagger/impl-remote v0.0.0-20250129172314-517df3f51a84
	github.com/DataDog/datadog-agent/pkg/util/fxutil v0.61.0
	go.uber.org/fx v1.23.0
)

require (
	github.com/DataDog/datadog-agent/comp/api/api/def v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/config v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/flare/builder v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/flare/types v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/log/def v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/comp/core/secrets v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/generic_store v0.0.0-20250129172314-517df3f51a84 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/origindetection v0.62.0-rc.7 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/telemetry v0.0.0-20250129172314-517df3f51a84 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/types v0.60.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/tagger/utils v0.60.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/telemetry v0.61.0 // indirect
	github.com/DataDog/datadog-agent/comp/def v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/api v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/collector/check/defaults v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/env v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/mock v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/model v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/nodetreemodel v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/setup v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/structure v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/teeconfig v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/utils v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/proto v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/tagger/types v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/tagset v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/cache v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/common v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/executable v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/filesystem v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/grpc v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/hostname/validate v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/http v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/log v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/option v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/util/pointer v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/scrubber v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/sort v0.60.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system/socket v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/winutil v0.61.0 // indirect
	github.com/DataDog/datadog-agent/pkg/version v0.61.0 // indirect
	github.com/DataDog/viper v1.14.0 // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cenkalti/backoff v2.2.1+incompatible // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cihub/seelog v0.0.0-20170130134532-f561c5e57575 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/ebitengine/purego v0.8.1 // indirect
	github.com/fsnotify/fsnotify v1.8.0 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.4.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.26.0 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
	github.com/hectane/go-acl v0.0.0-20230122075934-ca0b05cb1adb // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
	github.com/lufia/plan9stats v0.0.0-20240226150601-1dcf7310316a // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mitchellh/mapstructure v1.5.1-0.20231216201459-8508981c8b6c // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
	github.com/pelletier/go-toml v1.9.5 // indirect
	github.com/philhofer/fwd v1.1.3-0.20240916144458-20a13a1f6b7c // indirect
	github.com/pkg/errors v0.9.1 // indirect
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
	github.com/stretchr/testify v1.10.0 // indirect
	github.com/tinylib/msgp v1.2.5 // indirect
	github.com/tklauser/go-sysconf v0.3.14 // indirect
	github.com/tklauser/numcpus v0.8.0 // indirect
	github.com/twmb/murmur3 v1.1.8 // indirect
	github.com/yusufpapurcu/wmi v1.2.4 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.uber.org/dig v1.18.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.27.0 // indirect
	golang.org/x/exp v0.0.0-20250128182459-e0ece0dbea4c // indirect
	golang.org/x/net v0.34.0 // indirect
	golang.org/x/sys v0.29.0 // indirect
	golang.org/x/text v0.21.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20250115164207-1a7da9e5054f // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250127172529-29210b9bc287 // indirect
	google.golang.org/grpc v1.70.0 // indirect
	google.golang.org/protobuf v1.36.4 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/DataDog/datadog-agent/comp/api/api/def => ../../../api/api/def

replace github.com/DataDog/datadog-agent/comp/core/config => ../../config

replace github.com/DataDog/datadog-agent/comp/core/flare/builder => ../../flare/builder

replace github.com/DataDog/datadog-agent/comp/core/flare/types => ../../flare/types

replace github.com/DataDog/datadog-agent/comp/core/log/def => ../../log/def

replace github.com/DataDog/datadog-agent/comp/core/log/mock => ../../log/mock

replace github.com/DataDog/datadog-agent/comp/core/secrets => ../../secrets

replace github.com/DataDog/datadog-agent/comp/core/tagger/origindetection => ../origindetection

replace github.com/DataDog/datadog-agent/comp/core/tagger/types => ../types

replace github.com/DataDog/datadog-agent/comp/core/tagger/utils => ../utils

replace github.com/DataDog/datadog-agent/comp/core/telemetry => ../../telemetry

replace github.com/DataDog/datadog-agent/comp/def => ../../../def

replace github.com/DataDog/datadog-agent/pkg/collector/check/defaults => ../../../../pkg/collector/check/defaults

replace github.com/DataDog/datadog-agent/pkg/config/env => ../../../../pkg/config/env

replace github.com/DataDog/datadog-agent/pkg/config/mock => ../../../../pkg/config/mock

replace github.com/DataDog/datadog-agent/pkg/config/model => ../../../../pkg/config/model

replace github.com/DataDog/datadog-agent/pkg/config/nodetreemodel => ../../../../pkg/config/nodetreemodel

replace github.com/DataDog/datadog-agent/pkg/config/setup => ../../../../pkg/config/setup

replace github.com/DataDog/datadog-agent/pkg/config/teeconfig => ../../../../pkg/config/teeconfig

replace github.com/DataDog/datadog-agent/pkg/proto => ../../../../pkg/proto

replace github.com/DataDog/datadog-agent/pkg/tagger/types => ../../../../pkg/tagger/types

replace github.com/DataDog/datadog-agent/pkg/tagset => ../../../../pkg/tagset

replace github.com/DataDog/datadog-agent/pkg/util/common => ../../../../pkg/util/common

replace github.com/DataDog/datadog-agent/pkg/util/defaultpaths => ../../../../pkg/util/defaultpaths

replace github.com/DataDog/datadog-agent/pkg/util/executable => ../../../../pkg/util/executable

replace github.com/DataDog/datadog-agent/pkg/util/filesystem => ../../../../pkg/util/filesystem

replace github.com/DataDog/datadog-agent/pkg/util/grpc => ../../../../pkg/util/grpc

replace github.com/DataDog/datadog-agent/pkg/util/hostname/validate => ../../../../pkg/util/hostname/validate

replace github.com/DataDog/datadog-agent/pkg/util/http => ../../../../pkg/util/http

replace github.com/DataDog/datadog-agent/pkg/util/log => ../../../../pkg/util/log

replace github.com/DataDog/datadog-agent/pkg/util/log/setup => ../../../../pkg/util/log/setup

replace github.com/DataDog/datadog-agent/pkg/util/pointer => ../../../../pkg/util/pointer

replace github.com/DataDog/datadog-agent/pkg/util/scrubber => ../../../../pkg/util/scrubber

replace github.com/DataDog/datadog-agent/pkg/util/sort => ../../../../pkg/util/sort

replace github.com/DataDog/datadog-agent/pkg/util/system => ../../../../pkg/util/system

replace github.com/DataDog/datadog-agent/pkg/util/system/socket => ../../../../pkg/util/system/socket

replace github.com/DataDog/datadog-agent/pkg/util/testutil => ../../../../pkg/util/testutil

replace github.com/DataDog/datadog-agent/pkg/util/winutil => ../../../../pkg/util/winutil

replace github.com/DataDog/datadog-agent/pkg/config/structure => ../../../../pkg/config/structure

replace github.com/DataDog/datadog-agent/pkg/version => ../../../../pkg/version

replace github.com/DataDog/datadog-agent/comp/core/tagger/def => ../def

replace github.com/DataDog/datadog-agent/comp/core/tagger/generic_store => ../generic_store

replace github.com/DataDog/datadog-agent/comp/core/tagger/impl-remote => ../impl-remote

replace github.com/DataDog/datadog-agent/comp/core/tagger/telemetry => ../telemetry

replace github.com/DataDog/datadog-agent/pkg/api => ../../../../pkg/api

replace github.com/DataDog/datadog-agent/pkg/config/utils => ../../../../pkg/config/utils

replace github.com/DataDog/datadog-agent/pkg/util/cache => ../../../../pkg/util/cache

replace github.com/DataDog/datadog-agent/pkg/util/fxutil => ../../../../pkg/util/fxutil

replace github.com/DataDog/datadog-agent/pkg/util/option => ../../../../pkg/util/option
