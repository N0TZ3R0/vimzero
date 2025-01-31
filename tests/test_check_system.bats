#!/usr/bin/env bats

load test_helper

@test "check_system: verifies macOS" {
    if [[ "$(uname)" != "Darwin" ]]; then
        skip "Not running on macOS"
    fi
    run bash "$BATS_TEST_DIRNAME/../scripts/check_system.sh"
    assert_success
}

@test "check_system: checks for Homebrew" {
    source "$BATS_TEST_DIRNAME/../scripts/check_system.sh"
    run check_homebrew
    if command -v brew >/dev/null 2>&1; then
        assert_success
    else
        assert_failure
    fi
}
