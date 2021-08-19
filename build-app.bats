#!/usr/bin/env bats

load "support/bats-support/load"
load "support/bats-assert/load"

@test "$APP_NAME" {
  run echo $APP_NAME

  assert_success
}