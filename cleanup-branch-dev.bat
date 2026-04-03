@echo off
REM Reset all tracked files to their last committed state
git checkout -- .

REM Remove all untracked files and directories (but preserve .vscode)
git clean -fd

REM Explicitly remove common build artifacts to be thorough (preserving .vscode)
if exist node_modules rmdir /s /q node_modules
if exist dist rmdir /s /q dist
if exist es rmdir /s /q es
if exist lib rmdir /s /q lib
if exist locale rmdir /s /q locale
if exist _site rmdir /s /q _site
if exist _data rmdir /s /q _data
if exist coverage rmdir /s /q coverage
if exist jest-stare rmdir /s /q jest-stare
if exist .DS_Store del /f /q .DS_Store

REM Reset any staged changes
git reset --hard HEAD

REM Remove axe linter hooks
if exist .git\hooks\pre-commit-axe-linter del /f /q .git\hooks\pre-commit-axe-linter
if exist .git\hooks\pre-commit del /f /q .git\hooks\pre-commit

REM Switch to dev branch
git checkout dev
