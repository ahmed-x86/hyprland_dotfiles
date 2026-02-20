#!/usr/bin/env bash
set -euo pipefail

echo -e "\n--- [Step 1: System Update & Core Tools] ---"


echo -e "Updating system packages..."
sudo pacman -Syu --noconfirm

echo -e "Installing base-devel and essential tools..."
sudo pacman -S --needed --noconfirm base-devel git curl wget


if ! command -v yay &> /dev/null; then
    echo -e "Installing yay (AUR Helper)..."
    cd /tmp
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd ~
else
    echo -e "yay is already installed."
fi

echo -e "\nStep 1 completed successfully!"