#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo ""
echo "Installing shell tools..."

sudo apt update

sudo apt install -y \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    bat \
    fzf \
    ripgrep \
    eza \
    git \
    curl

echo ""
echo "Installing zoxide..."

if ! command -v zoxide >/dev/null 2>&1; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
else
    echo "zoxide is already installed."
fi

echo ""
echo "Installing Starship..."

if ! command -v starship >/dev/null 2>&1; then
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship is already installed."
fi

echo ""
echo "Configuring Zsh..."

if [ "$SHELL" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)"
fi

echo ""
echo "Shell environment installed successfully."
echo ""
echo "Log out and log back in to start using Zsh."

echo ""
echo "Installing shell configuration..."

CONFIG_DIR="$HOME/.config/renato-dev"

mkdir -p "$CONFIG_DIR"

cp "$ROOT_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
cp "$ROOT_DIR/dotfiles/aliases.sh" "$CONFIG_DIR/aliases.sh"
cp "$ROOT_DIR/dotfiles/functions.sh" "$CONFIG_DIR/functions.sh"
cp "$ROOT_DIR/dotfiles/exports.sh" "$CONFIG_DIR/exports.sh"

mkdir -p "$HOME/.config"

cp "$ROOT_DIR/dotfiles/starship.toml" \
    "$HOME/.config/starship.toml"
