#!/bin/bash

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/utils.sh"

log_info "Starting Vim setup..."

# Configuration variables
VIMZERO_DIR="$HOME/.vimzero"
INSTALL_DIR="$HOME/.local/bin"
VIM_REPO="https://github.com/vim/vim.git"
VIM_VERSION="v9.1.0000"

# Create necessary directories
mkdir -p "$VIMZERO_DIR"
mkdir -p "$INSTALL_DIR"

# Install dependencies via Homebrew
log_info "Installing dependencies..."
brew install \
    make \
    cmake \
    pkg-config \
    gettext \
    lua \
    python@3.13 || {
    log_error "Failed to install dependencies"
    exit 1
}

# Clone/update Vim repository
log_info "Cloning Vim repository..."
if [ -d "$VIMZERO_DIR/vim" ]; then
    cd "$VIMZERO_DIR/vim"
    git fetch
else
    git clone "$VIM_REPO" "$VIMZERO_DIR/vim"
    cd "$VIMZERO_DIR/vim"
fi

# Checkout specific version
git checkout "$VIM_VERSION"

# Configure and compile
log_info "Configuring Vim..."
./configure \
    --prefix="$INSTALL_DIR" \
    --with-features=huge \
    --enable-multibyte \
    --enable-python3interp=yes \
    --enable-luainterp=yes \
    --enable-fail-if-missing \
    --with-lua-prefix=/opt/homebrew \
    --enable-terminal \
    --enable-cscope \
    --with-tlib=ncurses \
    --enable-clip

log_info "Building Vim..."
make -j$(sysctl -n hw.ncpu)

log_info "Installing Vim..."
make install

log_success "Vim setup completed successfully!"
