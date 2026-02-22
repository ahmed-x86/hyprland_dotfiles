#!/usr/bin/env bash
set -euo pipefail

PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
RED="\e[31m"

start_time=$(date +%s)

clear

echo -e "${PINK}
 **********************************************************************
 * ⚠️  \e[1;4mWARNING\e[0m${PINK}:                                    *
 * This script will modify your system!                               *
 * It will install Hyprland and several dependencies.                 *
 * Make sure you know what you are doing before continuing.           *
 **********************************************************************
\n${WHITE}"

echo -e "${YELLOW}--- [Step 1: The Foundation] ---${WHITE}"

echo -e "${GREEN}Updating Pacman database...${WHITE}"
sudo pacman -Syu --noconfirm

echo -e "${GREEN}Installing essentials...${WHITE}"
sudo pacman -S --needed --noconfirm base-devel git curl wget networkmanager bluetooth

if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}Building yay-bin...${WHITE}"
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si --noconfirm
    cd -
fi

echo -e "${GREEN}Step 1 is ready. The ground is solid!${WHITE}\n"


end_time=$(date +%s)
duration=$((end_time - start_time))

hours=$((duration / 3600))
minutes=$(((duration % 3600) / 60))
seconds=$((duration % 60))

printf -v formatted_time "%02d:%02d:%02d" "$hours" "$minutes" "$seconds"

echo -e "${PINK}=========================================${WHITE}"
echo -e "${GREEN}Time elapsed: ${formatted_time}${WHITE}"
echo -e "${PINK}=========================================${WHITE}"
echo -e "\n${GREEN}\e[1mmission complete\e[0m\n"