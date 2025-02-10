#!/usr/bin/env bash

if [ "${COMPOSER_DEV_MODE}" != 1 ]; then
   echo "No Dev, not installing pre-commit hooks."
   exit
fi

GIT_DIR=$(git rev-parse --git-dir)
HOOKS_DIR="${GIT_DIR}/hooks"
PRE_COMMIT_LINK="${HOOKS_DIR}/pre-commit"
PREPARE_COMMIT_MSG_LINK="${HOOKS_DIR}/prepare-commit-msg"

echo "Installing hooks..."

# Remove existing symbolic links if they exist
if [ -L "$PRE_COMMIT_LINK" ]; then
    echo "Removing existing pre-commit symbolic link..."
    rm "$PRE_COMMIT_LINK"
fi

# Create new symbolic links
echo "Creating pre-commit file..."
cp -R "./scripts/pre-commit" "$PRE_COMMIT_LINK"

echo "Done!"
