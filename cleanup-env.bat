@echo off
echo Cleaning axe environment...

if exist "%USERPROFILE%\.npmrc" (
    del /f /q "%USERPROFILE%\.npmrc"
    echo Removed .npmrc
) else (
    echo No .npmrc found
)

podman rmi dequesystems/axe-mcp-server:latest >nul 2>&1 && (
    echo Removed axe MCP server image
) || (
    echo No axe MCP server image found
)

call npm uninstall -g @axe-devtools/cli >nul 2>&1 && (
    echo Uninstalled @axe-devtools/cli
) || (
    echo @axe-devtools/cli not installed
)

call npm uninstall -g @axe-devtools/axe-linter-connector >nul 2>&1 && (
    echo Uninstalled @axe-devtools/axe-linter-connector
) || (
    echo @axe-devtools/axe-linter-connector not installed
)

echo Done. Environment is clean for a fresh install.
