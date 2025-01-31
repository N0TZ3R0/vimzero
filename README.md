# VimZero

<div align="center">

![VimZero Logo](assets/logo.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-Apple%20Silicon-brightgreen)]()
[![Vim](https://img.shields.io/badge/vim-9.1.0000%2B-green.svg)](https://github.com/vim/vim)

A lightning-fast, minimal Vim distribution optimized for Apple Silicon Macs.

[Getting Started](#getting-started) •
[Features](#features) •
[Installation](#installation) •
[Configuration](#configuration) •
[Contributing](#contributing)

</div>

## Overview

VimZero is a carefully crafted Vim distribution designed specifically for Apple Silicon Macs (M1, M2, M3). It provides a seamless development environment while maintaining Vim's legendary speed and efficiency. Built with performance in mind, VimZero starts up in less than 50ms and includes only essential features needed for modern development.

## Features

### Core Philosophy
- 🚀 **Speed First**: Blazing fast startup (<50ms) and smooth operation
- 🎯 **Minimal by Design**: Only essential features included
- 🔧 **Apple Silicon Optimized**: Built specifically for M-series chips
- 🛠 **Zero Configuration**: Works out of the box with sensible defaults

### Key Features
- Native LSP support for code completion and navigation
- Fuzzy finding for files and text
- Git integration
- Terminal integration
- Full Unicode support
- True color support
- Custom statusline
- Session management

### Performance Metrics
- Startup Time: <50ms
- Memory Usage: <100MB
- Zero blocking operations
- Lazy-loaded plugins

## Getting Started

### Prerequisites

- macOS 11.0+ running on Apple Silicon (M1, M2, M3)
- Command Line Tools for Xcode
- Git
- Homebrew

### Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/N0TZ3R0/vimzero/main/install.sh | bash
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/N0TZ3R0/vimzero.git ~/.vimzero
```

2. Run the installation script:
```bash
cd ~/.vimzero && ./install.sh
```

3. Start using VimZero:
```bash
vz
```

## Configuration

VimZero comes with three configuration tiers:

### 1. Zero Config (Default)
- No configuration needed
- Starts in less than 50ms
- Basic IDE features

```bash
# Use zero config
vz
```

### 2. Minimal Config
- Basic development features
- <100ms startup time
- Essential plugins only

```bash
# Use minimal config
vz --minimal
```

### 3. Custom Config
Create `~/.vimzero/custom.vimrc` for your personal settings:

```vim
" Example custom configuration
let g:vimzero_custom_theme = 'nord'
let g:vimzero_custom_plugins = ['telescope', 'treesitter']
```

## Directory Structure

```
~/.vimzero/
├── bin/           # Executables and scripts
├── config/        # Configuration files
├── pack/          # Plugins (using Vim 8 packages)
└── cache/         # Cache directory
```

## Key Bindings

VimZero uses Space as the leader key. Here are some essential bindings:

### File Operations
- `<Space>f` - Find files
- `<Space>s` - Save file
- `<Space>q` - Close file
- `<Space>w` - Switch windows

### Code Navigation
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `<Space>a` - Code actions

### Terminal Integration
- `<Space>t` - Toggle terminal
- `<Space>g` - Git status

## Plugin Management

VimZero uses Vim's native package management. Add plugins to `~/.vimzero/pack/plugins/start/`:

```bash
# Add a plugin
vz --plugin add 'tpope/vim-fugitive'

# Remove a plugin
vz --plugin remove 'vim-fugitive'

# List installed plugins
vz --plugin list
```

## Performance Optimization

VimZero includes tools to monitor and optimize performance:

```bash
# Check startup time
vz --startup-time

# Profile specific features
vz --profile [feature]

# Generate performance report
vz --perf-report
```

## Troubleshooting

### Common Issues

1. **Slow Startup**
```bash
vz --debug-startup
```

2. **Plugin Conflicts**
```bash
vz --health-check
```

3. **Missing Features**
```bash
vz --doctor
```

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

1. Fork the repository
2. Create your feature branch
```bash
git checkout -b feature/amazing-feature
```
3. Commit your changes
```bash
git commit -m 'Add amazing feature'
```
4. Push to the branch
```bash
git push origin feature/amazing-feature
```
5. Open a Pull Request

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

## License

VimZero is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Vim and its community
- Apple Silicon development team
- All our contributors

---

<div align="center">
Made with ❤️ by N0TZ3R0
</div>
