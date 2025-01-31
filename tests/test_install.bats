#!/usr/bin/env bats

load test_helper

@test "install: full installation process" {
    run bash "$BATS_TEST_DIRNAME/../install.sh"
    assert_success
    assert [ -d "$HOME/.vimzero" ]
    assert [ -f "$HOME/.vimrc" ]
    assert [ -d "$HOME/.vim" ]
}

@test "install: creates all required directories" {
    run bash "$BATS_TEST_DIRNAME/../install.sh"
    assert [ -d "$HOME/.vimzero" ]
    assert [ -d "$HOME/.vim/backup" ]
    assert [ -d "$HOME/.vim/swap" ]
    assert [ -d "$HOME/.vim/undo" ]
}
