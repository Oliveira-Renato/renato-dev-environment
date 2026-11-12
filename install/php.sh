#!/usr/bin/env bash

set -euo pipefail

echo ""
echo "Installing PHP environment..."

if command -v php >/dev/null 2>&1; then
    echo "PHP is already installed."
    php -v
    exit 0
fi

curl -fsSL https://php.new/install/linux/8.4 | bash

echo ""
echo "PHP environment installed successfully."
echo ""
echo "Restart your terminal session before continuing."
