#!/usr/bin/env bats

load test_helper

@test "setup_vim: creates necessary directories" {
    run bash "$BATS_TEST_DIRNAME/../scripts/setup_vim.sh"
    assert [ -d "$HOME/.vimzero" ]
    assert [ -d "$HOME/.local/bin" ]
}

@test "setup_vim: vim compilation configuration exists" {
    run bash "$BATS_TEST_DIRNAME/../scripts/setup_vim.sh"
    assert [ -f "$HOME/.vimzero/vim/configure" ]
}
