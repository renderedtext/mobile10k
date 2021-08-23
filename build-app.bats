#!/usr/bin/env bats

load "../test/test_helper/bats-support/load"
load "../test/test_helper/bats-assert/load"

@test "$APP_NAME" {
  run ls -lah /
  # Command above should be replaces with e.g. make build $APP_NAME

  assert_success
}