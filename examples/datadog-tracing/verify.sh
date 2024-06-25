#!/bin/bash -e

export NAME=datadog-tracing
export PORT_PROXY="${DATADOG_PORT_PROXY:-10000}"

# shellcheck source=examples/verify-common.sh
. "$(dirname "${BASH_SOURCE[0]}")/../verify-common.sh"

run_log "Make a request to http service"
responds_with_header \
  "x-datadog-trace-id" \
  "httpL//localhost:${PORT_PROXY}"
