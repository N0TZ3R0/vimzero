#!/bin/bash

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/utils.sh"

log_info "Starting VimZero uninstallation..."

# Remove installation directory
if [ -d "$HOME/.vimzero" ]; then
    rm -rf "$HOME/.vimzero"
    log_info "Removed VimZero directory"
fi

# Remove vim configuration
if [ -L "$HOME/.vimrc" ]; then
    rm "$HOME/.vimrc"
    log_info "Removed VimZero configuration"
fi

# Restore backup if exists
if [ -f "$HOME/.vimrc.backup" ]; then
    mv "$HOME/.vimrc.backup" "$HOME/.vimrc"
    log_info "Restored original configuration"
fi

log_success "VimZero has been uninstalled successfully!"
