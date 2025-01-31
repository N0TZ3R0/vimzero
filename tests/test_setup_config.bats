#!/usr/bin/env bats

load test_helper

@test "setup_config: creates vim directories" {
    run bash "$BATS_TEST_DIRNAME/../scripts/setup_config.sh"
    assert [ -d "$HOME/.vim/backup" ]
    assert [ -d "$HOME/.vim/swap" ]
    assert [ -d "$HOME/.vim/undo" ]
}

@test "setup_config: creates vimrc symlink" {
    run bash "$BATS_TEST_DIRNAME/../scripts/setup_config.sh"
    assert [ -L "$HOME/.vimrc" ]
}

@test "setup_config: creates custom.vimrc" {
    run bash "$BATS_TEST_DIRNAME/../scripts/setup_config.sh"
    assert [ -f "$HOME/.vimzero/custom.vimrc" ]
}
