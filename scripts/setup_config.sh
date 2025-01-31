#!/bin/bash

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/utils.sh"

VIMZERO_DIR="$HOME/.vimzero"
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config"

log_info "Setting up VimZero configuration..."

# Create necessary directories first
ensure_dir "$VIMZERO_DIR"
ensure_dir "$HOME/.vim"
ensure_dir "$HOME/.vim/backup"
ensure_dir "$HOME/.vim/swap"
ensure_dir "$HOME/.vim/undo"

# Backup existing configuration
backup_file "$HOME/.vimrc"

# Link configuration files
log_info "Installing default configuration..."
ln -sf "${CONFIG_DIR}/default.vimrc" "$HOME/.vimrc"

# Create custom configuration if it doesn't exist
if [ ! -f "$VIMZERO_DIR/custom.vimrc" ]; then
    cat > "$VIMZERO_DIR/custom.vimrc" << 'EOL'
" Custom VimZero configuration
" Add your personal settings here
EOL
    log_info "Created custom configuration file"
fi

log_success "Configuration setup completed!"
