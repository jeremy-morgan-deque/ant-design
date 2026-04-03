#!/bin/bash
# Reset all tracked files to their last committed state
git checkout -- .

# Remove all untracked files and directories (but preserve .vscode)
git clean -fd

# Explicitly remove common build artifacts to be thorough (preserving .vscode)
rm -rf node_modules dist es lib locale _site _data coverage jest-stare .DS_Store

# Reset any staged changes
git reset --hard HEAD

# Remove axe linter hooks
rm -f .git/hooks/pre-commit-axe-linter
rm -f .git/hooks/pre-commit

# Switch to dev branch
git checkout dev