#!/bin/bash

LOG_DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$(date '+%Y-%m-%d').log"

log() {
  local level="$1"
  shift
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$timestamp] [$level] $*" | tee -a "$LOG_FILE"
}

log_info() {
  log "INFO" "$@"
}

log_error() {
  log "ERROR" "$@" >&2
}

log_warn() {
  echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] [\033[1;33mWARN\033[0m] $*"
}

