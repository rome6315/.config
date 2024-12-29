#!/bin/bash

# Set the path to your Git repository
REPO_PATH="$HOME/.config"

# Get the current branch
branch=$(git --git-dir=$REPO_PATH symbolic-ref --short HEAD 2>/dev/null)

# Check for staged, and unstaged changes
staged=$(git --git-dir=$REPO_PATH diff --cached --numstat | wc -l)
unstaged=$(git --git-dir=$REPO_PATH --work-tree "$HOME" diff --numstat | wc -l)

# Build the status string
status=""
if [[ $staged -gt 0 ]]; then
  status+=" $staged staged "
fi

if [[ $unstaged -gt 0 ]]; then
  status+=" $unstaged unstaged "
fi

# Default message if everything is clean
if [[ -z $status ]]; then
  status=" Clean"
fi

# Output for Waybar
echo "{\"text\": \"$status\", \"tooltip\": \"Git Repository: $REPO_PATH Branch: $branch\"}"
