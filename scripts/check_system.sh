#!/bin/bash

# Source utility functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/utils.sh"

# Main checks
echo "🔍 Checking system compatibility..."

# Check architecture
if [[ $(uname -m) != "arm64" ]]; then
    log_error "VimZero requires Apple Silicon (M1, M2, or M3) Mac"
    exit 1
fi

# Check macOS version
if [[ $(sw_vers -productVersion | cut -d. -f1) -lt 11 ]]; then
    log_error "VimZero requires macOS 11 (Big Sur) or later"
    exit 1
fi

# Run Homebrew check
check_homebrew || exit 1

# Check for Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
    log_error "Xcode Command Line Tools are required but not installed"
    log_info "Install with: xcode-select --install"
    exit 1
fi

echo "✅ System check passed!"
