#!/usr/bin/env bash

set -euo pipefail

echo ""
echo "Installing Docker..."

if command -v docker >/dev/null 2>&1; then
    echo "Docker is already installed."
    exit 0
fi

sudo apt remove -y \
docker.io \
docker-doc \
docker-compose \
docker-compose-v2 \
podman-docker \
containerd \
runc || true

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker "$USER"

echo ""
echo "Docker version:"
docker --version

echo ""
echo "Docker Compose version:"
docker compose version

echo ""
echo "Docker installed successfully!"
echo ""
echo "IMPORTANT:"
echo "Log out and log back in before using Docker without sudo."
