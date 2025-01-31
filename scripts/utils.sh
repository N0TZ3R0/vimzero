#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
VIMZERO_VERSION="0.1.0"

check_version() {
    log_info "VimZero version: $VIMZERO_VERSION"
}

# Logging functions
log_info() {
    echo -e "${BLUE}INFO: $1${NC}"
}

log_success() {
    echo -e "${GREEN}SUCCESS: $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}WARNING: $1${NC}"
}

log_error() {
    echo -e "${RED}ERROR: $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

check_homebrew() {
    if ! command_exists "brew"; then
        log_error "Homebrew is required but not installed"
        log_info "Install Homebrew from https://brew.sh"
        return 1
    fi
    return 0
}

# Backup file if exists
backup_file() {
    if [ -f "$1" ]; then
        mv "$1" "$1.backup.$(date +%Y%m%d%H%M%S)"
        log_info "Backed up $1"
    fi
}

# Check directory and create if not exists
ensure_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        log_info "Created directory $1"
    fi
}
