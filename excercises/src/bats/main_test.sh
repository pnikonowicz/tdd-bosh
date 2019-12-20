#!/usr/bin/env bats

@test "writes to stdout" {
  run bash /var/vcap/jobs/main/main.sh
  [ "$status" -eq 0 ]
  [ "$output" == "we are inside" ]
}
