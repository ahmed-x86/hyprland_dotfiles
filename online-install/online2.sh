#!/usr/bin/env bash
set -euo pipefail

WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"
RED="\e[31m"

echo -e "${BLUE}=======================================${WHITE}"
echo -e "${YELLOW}🔥 [Step 2]: Equipping the Arsenal (Arch & AUR Packages)...${WHITE}"
echo -e "${BLUE}=======================================${WHITE}\n"

echo -e "${GREEN}[+] Fetching official packages list from GitHub...${WHITE}"
ARCH_REPO_URL="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/refs/heads/main/arch_repo.txt"

ARCH_PACKAGES=$(curl -fsSL "$ARCH_REPO_URL" 2>/dev/null || true)

if [[ -n "$ARCH_PACKAGES" ]]; then
    echo -e "${GREEN}📦 Installing official packages...${WHITE}"

    sudo pacman -S --needed --noconfirm $ARCH_PACKAGES
else
    echo -e "${RED}   ⚠️ Warning: Could not fetch arch_repo.txt from GitHub! Skipping...${WHITE}"
fi


echo -e "\n${GREEN}[+] Fetching AUR packages list from GitHub...${WHITE}"
AUR_REPO_URL="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/refs/heads/main/aur_repo.txt"

AUR_PACKAGES=$(curl -fsSL "$AUR_REPO_URL" 2>/dev/null || true)

if [[ -n "$AUR_PACKAGES" ]]; then
    echo -e "${GREEN}📦 Installing AUR packages...${WHITE}"
    yay -S --needed --noconfirm $AUR_PACKAGES
else
    echo -e "${RED}   ⚠️ Warning: Could not fetch aur_repo.txt from GitHub! Skipping...${WHITE}"
fi


echo -e "\n${GREEN}⚙️ Enabling Network and Bluetooth services...${WHITE}"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

echo -e "\n${GREEN}✅ [Step 2]: The Arsenal is fully equipped and services are active!${WHITE}"