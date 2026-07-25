#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo ""
echo "Configuring SSH..."

SSH_KEY="$HOME/.ssh/id_ed25519"

if [ -f "$SSH_KEY" ]; then
    echo "SSH key already exists."
    exit 0
fi

read -rp "GitHub email: " EMAIL

ssh-keygen -t ed25519 -C "$EMAIL" -f "$SSH_KEY" -N ""

eval "$(ssh-agent -s)"

ssh-add "$SSH_KEY"

echo ""
echo "Copy this key to GitHub:"
echo ""

cat "${SSH_KEY}.pub"
