#!/usr/bin/env bats

setup()
{
    . shellmock
}

teardown()
{
    if [ -z "$TEST_FUNCTION" ]; then
        shellmock_clean
    fi
}

## normal bats
@test "writes to stdout" {
  run bash /var/vcap/jobs/main/main.sh
  [ "$status" -eq 0 ]
  [ "$output" == "we are inside" ]
}

#-----------------------------------------------------------------------------------
# This test case demonstrates a normal bats test case where sample.sh is under test.
# sample.sh will echo "sample found" based on the response to the grep command.
# The default output will always be "sample found" because the script ensures
# that grep will return 0.
#-----------------------------------------------------------------------------------
@test "sample.sh-success" {
    run ./sample.sh

    shellmock_dump

    [ "$status" = "0" ]

    # Validate using lines array.
    [ "${lines[0]}" = "sample found" ]

    # Optionally since this is a single line you can use $output
    [ "$output" = "sample found" ]

}

#----------------------------------------------------------------------------------------
# This test case demonstrates that the else condition if grep does not find the match.
# By forcing the status of 1 grep will cause the "sample not found" message to be echoed.
# To pull this off we need to mock the grep command.
#----------------------------------------------------------------------------------------
@test "sample.sh-failure" {
    shellmock_expect grep --status 1 --match '"sample line" sample.out'

    run ./sample.sh
    [ "$status" = "1" ]
    [ "$output" = "sample not found" ]

    shellmock_verify
    [ "${capture[0]}" = 'grep-stub sample line sample.out' ]

}


