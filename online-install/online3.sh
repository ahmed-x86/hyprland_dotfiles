#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

echo -e "\n${BLUE}🔥 [Step 3]: Setting up Aesthetics and Fonts (Online Mode)...${NC}"


echo -e "📦 Installing JetBrains Mono Nerd Font from official repos..."
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd

echo -e "📦 Installing Noto Fonts (Global Language & Emoji Support - No Tofu!)..."
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

if command -v yay &> /dev/null; then
    echo -e "📦 Installing Cairo Font via yay..."
    yay -S --needed --noconfirm ttf-cairo
else
    echo -e "⚠️  yay not found! Skipping Cairo font or install yay first."
fi

echo -e "${GREEN}🔠 Updating font cache for perfect rendering...${NC}"
fc-cache -fv

echo -e "${GREEN}✅ [Step 3]: Fonts and aesthetics setup completed successfully!${NC}\n"