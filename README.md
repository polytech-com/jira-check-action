# jira-check-action

Simple GitHub Action for checking that the PR title has a JIRA issue prefixed.

The JIRA issue must be created with capitalized letters and without any prefixed spaces for uniformity e.g. when using automated changelogs. Please see the `test.bats` file for valid and invalid cases. The tests requires [bats-core](https://bats-core.readthedocs.io/en/stable/installation.html) to be installed.

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
