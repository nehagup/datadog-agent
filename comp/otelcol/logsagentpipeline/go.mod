module github.com/DataDog/datadog-agent/comp/otelcol/logsagentpipeline

go 1.22.0

replace (
	github.com/DataDog/datadog-agent/comp/api/api/def => ../../api/api/def
	github.com/DataDog/datadog-agent/comp/core/config => ../../core/config
	github.com/DataDog/datadog-agent/comp/core/flare/builder => ../../core/flare/builder
	github.com/DataDog/datadog-agent/comp/core/flare/types => ../../core/flare/types
	github.com/DataDog/datadog-agent/comp/core/hostname/hostnameinterface => ../../core/hostname/hostnameinterface
	github.com/DataDog/datadog-agent/comp/core/log/def => ../../core/log/def
	github.com/DataDog/datadog-agent/comp/core/log/mock => ../../core/log/mock
	github.com/DataDog/datadog-agent/comp/core/secrets => ../../core/secrets
	github.com/DataDog/datadog-agent/comp/core/telemetry => ../../core/telemetry
	github.com/DataDog/datadog-agent/comp/def => ../../def
	github.com/DataDog/datadog-agent/comp/logs/agent/config => ../../logs/agent/config
	github.com/DataDog/datadog-agent/comp/serializer/logscompression => ../../serializer/logscompression
	github.com/DataDog/datadog-agent/comp/serializer/metricscompression => ../../serializer/metricscompression
	github.com/DataDog/datadog-agent/pkg/collector/check/defaults => ../../../pkg/collector/check/defaults
	github.com/DataDog/datadog-agent/pkg/config/env => ../../../pkg/config/env
	github.com/DataDog/datadog-agent/pkg/config/mock => ../../../pkg/config/mock
	github.com/DataDog/datadog-agent/pkg/config/model => ../../../pkg/config/model
	github.com/DataDog/datadog-agent/pkg/config/nodetreemodel => ../../../pkg/config/nodetreemodel
	github.com/DataDog/datadog-agent/pkg/config/setup => ../../../pkg/config/setup
	github.com/DataDog/datadog-agent/pkg/config/structure => ../../../pkg/config/structure
	github.com/DataDog/datadog-agent/pkg/config/teeconfig => ../../../pkg/config/teeconfig
	github.com/DataDog/datadog-agent/pkg/config/utils => ../../../pkg/config/utils
	github.com/DataDog/datadog-agent/pkg/logs/auditor => ../../../pkg/logs/auditor
	github.com/DataDog/datadog-agent/pkg/logs/client => ../../../pkg/logs/client
	github.com/DataDog/datadog-agent/pkg/logs/diagnostic => ../../../pkg/logs/diagnostic
	github.com/DataDog/datadog-agent/pkg/logs/message => ../../../pkg/logs/message
	github.com/DataDog/datadog-agent/pkg/logs/metrics => ../../../pkg/logs/metrics
	github.com/DataDog/datadog-agent/pkg/logs/pipeline => ../../../pkg/logs/pipeline
	github.com/DataDog/datadog-agent/pkg/logs/processor => ../../../pkg/logs/processor
	github.com/DataDog/datadog-agent/pkg/logs/sds => ../../../pkg/logs/sds
	github.com/DataDog/datadog-agent/pkg/logs/sender => ../../../pkg/logs/sender
	github.com/DataDog/datadog-agent/pkg/logs/sources => ../../../pkg/logs/sources
	github.com/DataDog/datadog-agent/pkg/logs/status/statusinterface => ../../../pkg/logs/status/statusinterface
	github.com/DataDog/datadog-agent/pkg/logs/status/utils => ../../../pkg/logs/status/utils
	github.com/DataDog/datadog-agent/pkg/logs/util/testutils => ../../../pkg/logs/util/testutils
	github.com/DataDog/datadog-agent/pkg/status/health => ../../../pkg/status/health
	github.com/DataDog/datadog-agent/pkg/telemetry => ../../../pkg/telemetry
	github.com/DataDog/datadog-agent/pkg/util/backoff => ../../../pkg/util/backoff
	github.com/DataDog/datadog-agent/pkg/util/compression => ../../../pkg/util/compression
	github.com/DataDog/datadog-agent/pkg/util/defaultpaths => ../../../pkg/util/defaultpaths
	github.com/DataDog/datadog-agent/pkg/util/executable => ../../../pkg/util/executable
	github.com/DataDog/datadog-agent/pkg/util/filesystem => ../../../pkg/util/filesystem
	github.com/DataDog/datadog-agent/pkg/util/fxutil => ../../../pkg/util/fxutil
	github.com/DataDog/datadog-agent/pkg/util/hostname/validate => ../../../pkg/util/hostname/validate
	github.com/DataDog/datadog-agent/pkg/util/http => ../../../pkg/util/http
	github.com/DataDog/datadog-agent/pkg/util/log => ../../../pkg/util/log
	github.com/DataDog/datadog-agent/pkg/util/log/setup => ../../../pkg/util/log/setup
	github.com/DataDog/datadog-agent/pkg/util/option => ../../../pkg/util/option
	github.com/DataDog/datadog-agent/pkg/util/pointer => ../../../pkg/util/pointer
	github.com/DataDog/datadog-agent/pkg/util/scrubber => ../../../pkg/util/scrubber
	github.com/DataDog/datadog-agent/pkg/util/startstop => ../../../pkg/util/startstop
	github.com/DataDog/datadog-agent/pkg/util/statstracker => ../../../pkg/util/statstracker
	github.com/DataDog/datadog-agent/pkg/util/system => ../../../pkg/util/system
	github.com/DataDog/datadog-agent/pkg/util/system/socket => ../../../pkg/util/system/socket
	github.com/DataDog/datadog-agent/pkg/util/testutil => ../../../pkg/util/testutil
	github.com/DataDog/datadog-agent/pkg/util/utilizationtracker => ../../../pkg/util/utilizationtracker
	github.com/DataDog/datadog-agent/pkg/util/winutil => ../../../pkg/util/winutil
	github.com/DataDog/datadog-agent/pkg/version => ../../../pkg/version
)

require github.com/DataDog/datadog-agent/pkg/logs/pipeline v0.56.0-rc.3

require (
	github.com/DataDog/agent-payload/v5 v5.0.143 // indirect
	github.com/DataDog/datadog-agent/comp/core/hostname/hostnameinterface v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/comp/core/secrets v0.59.0 // indirect
	github.com/DataDog/datadog-agent/comp/core/telemetry v0.60.1 // indirect
	github.com/DataDog/datadog-agent/comp/def v0.59.0 // indirect
	github.com/DataDog/datadog-agent/comp/logs/agent/config v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/comp/serializer/logscompression v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/collector/check/defaults v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/env v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/model v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/nodetreemodel v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/config/setup v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/structure v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/teeconfig v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/config/utils v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/auditor v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/client v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/diagnostic v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/message v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/metrics v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/processor v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/sds v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/sender v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/sources v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/status/statusinterface v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/logs/status/utils v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/status/health v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/telemetry v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/backoff v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/compression v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/executable v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/filesystem v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/fxutil v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/hostname/validate v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/http v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/log v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/option v0.64.0-devel // indirect
	github.com/DataDog/datadog-agent/pkg/util/pointer v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/scrubber v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/startstop v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/statstracker v0.56.0-rc.3 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/util/system/socket v0.59.0 // indirect
	github.com/DataDog/datadog-agent/pkg/util/winutil v0.60.1 // indirect
	github.com/DataDog/datadog-agent/pkg/version v0.59.1 // indirect
	github.com/DataDog/dd-sensitive-data-scanner/sds-go/go v0.0.0-20240816154533-f7f9beb53a42 // indirect
	github.com/DataDog/viper v1.14.0 // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/benbjohnson/clock v1.3.5 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/cihub/seelog v0.0.0-20170130134532-f561c5e57575 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/ebitengine/purego v0.8.1 // indirect
	github.com/fsnotify/fsnotify v1.8.0 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
	github.com/hectane/go-acl v0.0.0-20230122075934-ca0b05cb1adb // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
	github.com/klauspost/compress v1.17.11 // indirect
	github.com/lufia/plan9stats v0.0.0-20240226150601-1dcf7310316a // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mitchellh/mapstructure v1.5.1-0.20231216201459-8508981c8b6c // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
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
	github.com/stretchr/testify v1.10.0 // indirect
	github.com/tklauser/go-sysconf v0.3.14 // indirect
	github.com/tklauser/numcpus v0.8.0 // indirect
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
	google.golang.org/protobuf v1.36.4 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
