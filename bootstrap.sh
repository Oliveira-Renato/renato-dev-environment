#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "======================================"
echo " Renato Development Environment"
echo "======================================"
echo ""

bash "$ROOT_DIR/install/system.sh"
bash "$ROOT_DIR/install/git.sh"
bash "$ROOT_DIR/install/ssh.sh"

echo ""
echo "Bootstrap finished successfully."
