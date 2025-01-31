#!/bin/bash

# Exit on error
set -e

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source utilities
source "$SCRIPT_DIR/scripts/utils.sh" || {
    echo "❌ Failed to source utils.sh"
    exit 1
}

# Print banner
log_info "
 __   ___           ______
 \ \ / (_)         |___  /
  \ V / _ _ __ ___   / / ___ _ __ ___
   > < | | '_ ' _ \ / / / _ \ '__/ _ \\
  / . \| | | | | | / /_|  __/ | | (_) |
 /_/ \_\_|_| |_| |_/____|\___|_|  \___/
"

log_info "Starting VimZero installation..."

# Create necessary directories
ensure_dir "$HOME/.vimzero"

# 1. System Check
log_info "Checking system compatibility..."
if ! bash "$SCRIPT_DIR/scripts/check_system.sh"; then
    log_error "System check failed"
    exit 1
fi

# 2. Vim Setup
log_info "Setting up Vim..."
if ! bash "$SCRIPT_DIR/scripts/setup_vim.sh"; then
    log_error "Vim setup failed"
    exit 1
fi

# 3. Configuration Setup
log_info "Configuring VimZero..."
if ! bash "$SCRIPT_DIR/scripts/setup_config.sh"; then
    log_error "Configuration setup failed"
    exit 1
fi

# Success message
log_success "VimZero has been successfully installed!"
echo "
Next steps:
1. Restart your terminal or source your shell config
2. Run 'vz' to start VimZero
3. Check out the documentation at: https://github.com/N0TZ3R0/vimzero

Enjoy your new Vim experience! 🎉
"
