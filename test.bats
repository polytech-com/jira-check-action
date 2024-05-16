#!/usr/bin/env bats

@test "Test valid cases" {
  run ./entrypoint.sh "JI-0 My Issue Title"
  [ "$status" -eq 0 ]
  run ./entrypoint.sh "JIRA-123 My Issue Title"
  [ "$status" -eq 0 ]
  run ./entrypoint.sh "JIRAISSUE-1234567890 My Issue Title"
  [ "$status" -eq 0 ]
}

@test "Test invalid cases" {
  run ./entrypoint.sh "J-0 My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JI-0"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "ji-0 My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "jira-0 My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA- My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA0 My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA-0a My Issue Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh " JIRA-123 My Issue Title"
  [ "$status" -eq 1 ]
}
