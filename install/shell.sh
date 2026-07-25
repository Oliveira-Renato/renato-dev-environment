#!/usr/bin/env bash

set -euo pipefail

echo ""
echo "Installing shell tools..."

sudo apt install -y \
zsh \
bat \
fzf \
ripgrep
