#!/usr/bin/env bash
set -euo pipefail

echo -e "\n🔥 [Step 3]: Setting up Aesthetics and Fonts..."

echo -e "📦 Installing JetBrains Mono Nerd Font..."
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd

echo -e "📦 Installing Noto Fonts (Global Language & Emoji Support - No Tofu!)..."
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

echo -e "📦 Installing Cairo Font..."
yay -S --needed --noconfirm ttf-cairo

echo -e "🔠 Updating font cache to ensure perfect text and icon rendering..."
fc-cache -fv

echo -e "✅ [Step 3]: Fonts and aesthetics setup completed successfully!\n"