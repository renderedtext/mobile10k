#!/usr/bin/env bats

load "test/test_helper/bats-support/load"
load "test/test_helper/bats-assert/load"

@test "$APP_NAME" {
  run echo $APP_NAME

  assert_success
}