#!/bin/bash

# Set up test environment
setup() {
    # Load bats helper plugins
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'

    # Set up temporary test directory
    export VIMZERO_TEST_DIR="$(mktemp -d)"
    export HOME="$VIMZERO_TEST_DIR"
    export PATH="$BATS_TEST_DIRNAME/../scripts:$PATH"
}

# Clean up after tests
teardown() {
    rm -rf "$VIMZERO_TEST_DIR"
}
