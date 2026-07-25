#!/usr/bin/env bash

set -euo pipefail

echo "Updating package list..."

sudo apt update

echo "Upgrading installed packages..."

sudo apt full-upgrade -y

echo "Installing base packages..."

sudo apt install -y \
curl \
wget \
git \
build-essential \
software-properties-common \
apt-transport-https \
ca-certificates \
gnupg \
unzip \
zip \
tree \
htop \
btop \
fastfetch
