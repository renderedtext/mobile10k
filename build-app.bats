#!/usr/bin/env bats

load "../test/test_helper/bats-support/load"
load "../test/test_helper/bats-assert/load"

@test "$APP_NAME" {
  run ls -lah /wewew

  assert_success
}