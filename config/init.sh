#!/bin/bash

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../scripts/utils.sh"

# Configuration type (default or minimal)
CONFIG_TYPE=${1:-default}

log_info "Initializing ${CONFIG_TYPE} configuration..."

# Validate configuration type
if [ "$CONFIG_TYPE" != "default" ] && [ "$CONFIG_TYPE" != "minimal" ]; then
    log_error "Invalid configuration type. Use 'default' or 'minimal'"
    exit 1
fi

# Link appropriate configuration
ln -sf "${SCRIPT_DIR}/${CONFIG_TYPE}.vimrc" "$HOME/.vimrc"

log_success "Configuration initialized: ${CONFIG_TYPE}"
