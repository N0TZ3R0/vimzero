#!/bin/bash

# Install bats if not present
if ! command -v bats >/dev/null 2>&1; then
    echo "Installing bats-core..."
    git clone https://github.com/bats-core/bats-core.git
    cd bats-core
    ./install.sh /usr/local
    cd ..
    rm -rf bats-core
fi

# Install bats helpers
if [ ! -d "test_helper" ]; then
    mkdir -p test_helper
    git clone https://github.com/bats-core/bats-support test_helper/bats-support
    git clone https://github.com/bats-core/bats-assert test_helper/bats-assert
fi

# Run all tests
bats ./*.bats
