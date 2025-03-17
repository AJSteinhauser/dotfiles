#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Find the root directory of the git repository
REPO_ROOT=$(git rev-parse --show-toplevel)

if [ -z "$REPO_ROOT" ]; then
  echo "Error: Not inside a git repository" >&2
  exit 1
fi

# Get the parent directory and the repository folder name
PARENT_DIR=$(dirname "$REPO_ROOT")
REPO_NAME=$(basename "$REPO_ROOT")

# Check if the folder is already named .dotfiles
if [ "$REPO_NAME" = ".dotfiles" ]; then
  echo "Repository is already named .dotfiles" >&2
  exit 0
fi

echo "Renaming $REPO_NAME to .dotfiles..."

# Go to the parent directory
cd "$PARENT_DIR" || { echo "Failed to change to parent directory"; exit 1; }

# Rename using the relative path
if ! mv "$REPO_NAME" ".dotfiles"; then
  echo "Error: Failed to rename repository folder to .dotfiles" >&2
  exit 1
fi

echo "Successfully renamed repository folder to .dotfiles"
exit 0

