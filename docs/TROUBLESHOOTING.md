# VimZero Troubleshooting Guide

## Common Issues

### Installation Issues

1. **Permission Denied**
```bash
Error: Permission denied while executing install.sh
```
Solution:
```bash
chmod +x install.sh
chmod +x scripts/*.sh
```

2. **Homebrew Not Found**
```bash
Error: Homebrew is required but not installed
```
Solution:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. **Missing Command Line Tools**
```bash
Error: Xcode Command Line Tools are required
```
Solution:
```bash
xcode-select --install
```

### Configuration Issues

1. **Config Not Loading**
- Check if `.vimrc` exists:
```bash
ls -la ~/.vimrc
```
- Verify symlink:
```bash
readlink ~/.vimrc
```

2. **Slow Startup**
- Check startup time:
```bash
vim --startuptime startup.log
```
- Review `startup.log` for delays

3. **Plugin Conflicts**
- Start vim without plugins:
```bash
vim -u NONE
```
- Test minimal config:
```bash
vz --minimal
```

### Runtime Issues

1. **Command 'vz' Not Found**
- Check PATH:
```bash
echo $PATH
```
- Verify installation:
```bash
which vz
```

2. **Custom Configuration Not Applied**
- Check custom.vimrc location:
```bash
ls -la ~/.vimzero/custom.vimrc
```
- Verify sourcing in main config

3. **Performance Issues**
- Monitor resource usage:
```bash
top -pid $(pgrep vim)
```
- Check loaded plugins:
```bash
:scriptnames
```

## Diagnostics

### System Check
```bash
./scripts/check_system.sh
```

### Config Verification
```bash
./scripts/setup_config.sh --verify
```

### Installation Verification
```bash
./scripts/setup_vim.sh --check
```

## Recovery

### Reset Configuration
```bash
./scripts/uninstall.sh
./install.sh
```

### Backup Recovery
```bash
# Restore previous configuration
mv ~/.vimrc.backup.TIMESTAMP ~/.vimrc
```

### Clean Installation
```bash
./scripts/uninstall.sh --purge
./install.sh --fresh
```

## Getting Help

1. Check GitHub Issues
2. Run diagnostics:
```bash
vz --doctor
```
3. Include in bug reports:
   - VimZero version
   - macOS version
   - Installation method
   - Error messages
   - Steps to reproduce
