#!/bin/bash

JIRA_ID=$(echo $1 | cut -d' ' -f1)

if ! [[ "$JIRA_ID" =~ [A-Z]{2}-[0-9]+$ ]]; then
  exit 1
fi
