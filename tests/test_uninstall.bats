#!/usr/bin/env bats

load test_helper

@test "uninstall: removes all VimZero files" {
    # First install
    bash "$BATS_TEST_DIRNAME/../install.sh"

    # Then uninstall
    run bash "$BATS_TEST_DIRNAME/../scripts/uninstall.sh"
    assert_success
    assert [ ! -d "$HOME/.vimzero" ]
    assert [ ! -L "$HOME/.vimrc" ]
}
