#!/usr/bin/env bats

@test "writes to stdout" {
  run bash ./stdout.sh
  [ "$status" -eq 0 ]
  [ "$output" == "we are inside" ]
}