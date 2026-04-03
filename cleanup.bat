@echo off
REM Reset all tracked files to their last committed state
git checkout -- .

REM Remove all untracked files and directories (but preserve .vscode)
git clean -fd

REM Explicitly remove common build artifacts to be thorough (preserving .vscode)
if exist node_modules rmdir /s /q node_modules
if exist dist rmdir /s /q dist
if exist test-results rmdir /s /q test-results
if exist playwright-report rmdir /s /q playwright-report
if exist blob-report rmdir /s /q blob-report
if exist .DS_Store del /f /q .DS_Store

REM Reset any staged changes
git reset --hard HEAD

REM Remove axe linter hooks
if exist .git\hooks\pre-commit-axe-linter del /f /q .git\hooks\pre-commit-axe-linter
if exist .git\hooks\pre-commit del /f /q .git\hooks\pre-commit
