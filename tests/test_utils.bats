#!/usr/bin/env bats

load test_helper

@test "utils: log_info function works" {
    source "$BATS_TEST_DIRNAME/../scripts/utils.sh"
    run log_info "Test message"
    assert_success
    assert_output --partial "INFO: Test message"
}

@test "utils: command_exists finds existing command" {
    source "$BATS_TEST_DIRNAME/../scripts/utils.sh"
    run command_exists "ls"
    assert_success
}

@test "utils: command_exists fails for non-existing command" {
    source "$BATS_TEST_DIRNAME/../scripts/utils.sh"
    run command_exists "nonexistingcommand123"
    assert_failure
}
