#!/bin/bash
set -e

echo "Cleaning axe environment..."

rm -f ~/.npmrc
echo "Removed .npmrc"

podman rmi dequesystems/axe-mcp-server:latest 2>/dev/null && echo "Removed axe MCP server image" || echo "No axe MCP server image found"

npm uninstall -g @axe-devtools/cli 2>/dev/null && echo "Uninstalled @axe-devtools/cli" || echo "@axe-devtools/cli not installed"

npm uninstall -g @axe-devtools/axe-linter-connector 2>/dev/null && echo "Uninstalled @axe-devtools/axe-linter-connector" || echo "@axe-devtools/axe-linter-connector not installed"

npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

echo "Done. Environment is clean for a fresh install."
