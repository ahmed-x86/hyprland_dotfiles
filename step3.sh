#!/bin/bash

echo -e "\n🔥 [Step 3]: Setting up Aesthetics and Fonts..."

echo -e "📦 Installing JetBrains Mono Nerd Font..."
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd

echo -e "📦 Installing Cairo Font "
yay -S --noconfirm ttf-cairo

echo -e "🔠 Updating font cache to ensure perfect text and icon rendering..."
fc-cache -fv

echo -e "✅ [Step 3]: Fonts and aesthetics setup completed successfully!\n"