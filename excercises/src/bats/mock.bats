#!/usr/bin/env bats

setup()
{
    # Source the shellmock functions into the shell.
    . ./shellmock

    skipIfNot "$BATS_TEST_DESCRIPTION"

    shellmock_clean
}

teardown()
{
    if [ -z "$TEST_FUNCTION" ];then
        shellmock_clean
    fi
}

@test "file is cat'd" {
    shellmock_expect cat --match 'file.txt'

    shellmock_debug "starting the test"

    run bash ./stdout.sh

    shellmock_dump

    [ "$status" = "0" ]
    
    shellmock_verify
    [ "${capture[0]}" = 'cat-stub file.txt' ]
}