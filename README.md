# jira-check-action

Simple GitHub Action for checking that the pull request title has a JIRA issue prefixed.

The prefixed JIRA issue on the pull request title must be created with capitalized letters and without any prefixed spaces (e.g. "JIRA-123 My Awesome Title") for uniformity. The check is a bit pendantic so it can be used for e.g. automated GitHub release notes with JIRA links. Please see the [test.bats](https://github.com/polytech-com/jira-check-action/blob/main/test.bats) file for valid and invalid cases. The tests requires [bats-core](https://bats-core.readthedocs.io/en/stable/installation.html) to be installed.

## Usage

Below is an example GitHub Action file showing the usage.

```yml
name: ci

on:
  pull_request:
    branches:
      - main

jobs:
  check-jira-issue:
    runs-on: ubuntu-latest
    steps:
      - name: Check JIRA Issue
        uses: polytech-com/jira-check-action@v2
```
