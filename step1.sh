#!/usr/bin/env bash
set -euo pipefail
#hi it's
echo -e "--- [Step 1: The Foundation] ---"

echo -e "Updating Pacman database..."
sudo pacman -Syu --noconfirm

echo -e "Installing essentials..."
sudo pacman -S --needed --noconfirm base-devel git curl wget networkmanager bluetooth


if ! command -v yay &> /dev/null; then
    echo -e "Building yay-bin..."
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si --noconfirm
    cd -
fi

echo -e "Step 1 is ready. The ground is solid!"