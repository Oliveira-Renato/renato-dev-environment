#!/usr/bin/env bash

set -euo pipefail

echo ""
echo "Configuring Git..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global fetch.prune true
git config --global core.editor "code --wait"
git config --global core.excludesfile "$HOME/.gitignore_global"

# Aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.last "log -1 HEAD"
git config --global alias.graph "log --all --decorate --oneline --graph"

cp "$ROOT_DIR/dotfiles/.gitignore_global" "$HOME/.gitignore_global"

echo "Git configured successfully."
