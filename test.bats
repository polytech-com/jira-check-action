#!/usr/bin/env bats

@test "Test valid cases" {
  run ./entrypoint.sh "JI-0 My Awesome Title"
  [ "$status" -eq 0 ]
  run ./entrypoint.sh "JIRA-123 My Awesome Title"
  [ "$status" -eq 0 ]
  run ./entrypoint.sh "JIRAISSUE-1234567890 My Awesome Title"
  [ "$status" -eq 0 ]
  run ./entrypoint.sh "JIR-321 123 My Awesome Title"
  [ "$status" -eq 0 ]
}

@test "Test invalid cases" {
  run ./entrypoint.sh "J-0 My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JI-0 "
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JI-0  My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "ji-0 My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "jira-0 My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA- My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA0 My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh "JIRA-0: My Awesome Title"
  [ "$status" -eq 1 ]
  run ./entrypoint.sh " JIRA-123 My Awesome Title"
  [ "$status" -eq 1 ]
}
