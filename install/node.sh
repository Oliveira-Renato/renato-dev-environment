#!/usr/bin/env bash

set -euo pipefail

echo ""
echo "Installing Node.js environment..."

NVM_DIR="$HOME/.nvm"
NVM_INSTALL_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh"

# Install NVM
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    echo "Installing NVM..."

    curl -fsSL "$NVM_INSTALL_URL" | PROFILE=/dev/null bash
else
    echo "NVM is already installed."
fi

# Load NVM
export NVM_DIR
source "$NVM_DIR/nvm.sh"

# Node.js versions
NODE_VERSIONS=(16 18 20 22 24)

for version in "${NODE_VERSIONS[@]}"; do
    echo ""
    echo "Installing Node.js $version..."

    if ! nvm ls "$version" | grep -q "v${version}"; then
        nvm install "$version"
    else
        echo "Node.js $version is already installed."
    fi

    nvm use "$version"

    # Enable Corepack when available
    if ! command -v corepack >/dev/null 2>&1; then
        npm install -g corepack
    fi

    corepack enable

    # Yarn Classic as default for legacy compatibility
    corepack prepare yarn@1.22.22 --activate
done

# Set Node.js 24 as default
nvm alias default 24
nvm use default

echo ""
echo "Node.js environment installed successfully."

echo ""
echo "Installed versions:"
nvm ls

echo ""
echo "Current versions:"
node --version
npm --version
yarn --version

echo ""
echo "Default Node.js version: 24"
