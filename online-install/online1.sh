#!/usr/bin/env bash
set -euo pipefail


WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"

echo -e "${BLUE}=======================================${WHITE}"
echo -e "${YELLOW}--- [Step 1: The Foundation] ---${WHITE}"
echo -e "${BLUE}=======================================${WHITE}\n"

echo -e "${GREEN}[+] Updating Pacman database and system...${WHITE}"
sudo pacman -Syu --noconfirm

echo -e "\n${GREEN}[+] Installing core essentials (base-devel, network, bluetooth)...${WHITE}"
sudo pacman -S --needed --noconfirm base-devel git curl wget networkmanager bluetooth

if ! command -v yay &> /dev/null; then
    echo -e "\n${YELLOW}[!] yay is not installed. Building yay-bin from AUR...${WHITE}"
    
    rm -rf /tmp/yay-bin 
    
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    
    makepkg -si --noconfirm
    
    cd - > /dev/null 
    
    echo -e "${GREEN}[+] Cleaning up yay build files...${WHITE}"
    rm -rf /tmp/yay-bin
else
    echo -e "\n${GREEN}[+] yay is already installed! Skipping build process...${WHITE}"
fi

echo -e "\n${GREEN}[✔] Step 1 is ready. The ground is solid!${WHITE}"