#!/usr/bin/env python3

import subprocess
import os
import json

# Set the path to your Git repository
repo_path = os.path.expanduser("~/.config")

# Get the current branch
try:
    branch = subprocess.check_output(
        ["git", "--git-dir", repo_path, "symbolic-ref", "--short", "HEAD"],
        stderr=subprocess.PIPE
    ).decode().strip()
except subprocess.CalledProcessError:
    branch = "unknown"

# Check for staged and unstaged changes
def get_changes(git_dir, work_tree):
    staged = subprocess.check_output(
        ["git", "--git-dir", git_dir, "--work-tree", work_tree, "diff", "--cached", "--numstat"],
        stderr=subprocess.PIPE
    ).decode().strip().splitlines()
    
    unstaged = subprocess.check_output(
        ["git", "--git-dir", git_dir, "--work-tree", work_tree, "diff", "--numstat"],
        stderr=subprocess.PIPE
    ).decode().strip().splitlines()
    
    return len(staged), len(unstaged)

staged, unstaged = get_changes(repo_path, os.path.expanduser("~"))

# Build the status string
status = ""
if staged > 0:
    status += f" {staged} staged "
if unstaged > 0:
    status += f" {unstaged} unstaged "

# Default message if everything is clean
if not status:
    status = " Clean"

# Prepare the output JSON
output = {
    "text": status,
    "tooltip": f"Git Repository: {repo_path} Branch: {branch}"
}

# Print the output to ensure correct JSON format
json_output = json.dumps(output)

# Debugging step: Print the raw JSON to check its format
# Uncomment this if you want to inspect the output before it's printed
# print("JSON Output:", json_output)

# Output the JSON to Waybar
print(json_output)

