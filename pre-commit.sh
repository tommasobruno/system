#!/bin/sh

COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat $COMMIT_MSG_FILE)

# Define the regex pattern for allowed commit types
COMMIT_PATTERN="^(feat|fix|chore|refactor|perf|test|build|ci): .+"

# Check if the commit message matches the pattern
if ! echo "$COMMIT_MSG" | grep -Eq "$COMMIT_PATTERN"; then
  echo "Error: Invalid commit message format."
  echo "Commit message should start with 'feat', 'fix', 'chore', 'refactor', 'test', 'build', 'ci' followed by a colon and a space."
  exit 1
fi
