#!/bin/bash

echo -e "\n🔥 [Step 2]: Equipping the Arsenal (Arch & AUR Packages)..."

if [ -f "arch_repo.txt" ]; then
    echo -e "📦 Installing official packages from arch_repo.txt..."
    sudo pacman -S --needed --noconfirm $(cat arch_repo.txt)
else
    echo -e "   ⚠️ Warning: arch_repo.txt not found! Skipping..."
fi

if [ -f "aur_repo.txt" ]; then
    echo -e "📦 Installing AUR packages from aur_repo.txt..."
    yay -S --needed --noconfirm $(cat aur_repo.txt)
else
    echo -e "   ⚠️ Warning: aur_repo.txt not found! Skipping..."
fi

echo -e "⚙️ Enabling Network and Bluetooth services..."
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

echo -e "✅ [Step 2]: The Arsenal is fully equipped and services are active!\n"