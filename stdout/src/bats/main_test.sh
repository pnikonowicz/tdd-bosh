#!/usr/bin/env bats

@test "writes to stdout" {
  result="$(bash /var/vcap/jobs/main/main.sh)"
  [ "$result" == "we are inside" ]
}
