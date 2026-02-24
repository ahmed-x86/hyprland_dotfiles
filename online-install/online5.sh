#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' 

echo -e "\n${CYAN}🔥 [Online Step 5]: Forging the Terminal (Zsh & Oh-My-Posh)...${NC}"

USER_HOME="$HOME"
OMP_CONFIG_DIR="$USER_HOME/.config/ohmyposh"

ZSHRC_URL="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.zshrc"

echo -e "\n${BLUE}📦 Checking and installing Zsh...${NC}"
if ! command -v zsh &> /dev/null; then
    sudo pacman -S --noconfirm zsh
else
    echo -e "   ${GREEN}✔️ Zsh is already installed.${NC}"
fi

echo -e "\n${BLUE}📦 Installing Oh-My-Posh...${NC}"
if ! command -v oh-my-posh &> /dev/null; then
    yay -S --noconfirm oh-my-posh-bin
else
    echo -e "   ${GREEN}✔️ Oh-My-Posh is already installed.${NC}"
fi

echo -e "\n${BLUE}🎨 Downloading Catppuccin theme for Oh-My-Posh...${NC}"
mkdir -p "$OMP_CONFIG_DIR"
if curl -sLo "$OMP_CONFIG_DIR/catppuccin.omp.json" "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/catppuccin.omp.json"; then
    echo -e "   ${GREEN}✔️ Theme successfully downloaded.${NC}"
else
    echo -e "   ${RED}⚠️ Error: Failed to download the theme!${NC}"
fi

echo -e "\n${BLUE}📄 Fetching .zshrc configuration from GitHub...${NC}"
if curl -sLf "$ZSHRC_URL" -o "$USER_HOME/.zshrc"; then
    echo -e "   ${GREEN}✔️ .zshrc successfully downloaded and placed in $USER_HOME.${NC}"
else
    echo -e "   ${RED}⚠️ Warning: Failed to fetch .zshrc! Please check the ZSHRC_URL variable.${NC}"
fi

echo -e "\n${BLUE}🔄 Changing default shell to Zsh...${NC}"
CURRENT_SHELL=$(basename "$SHELL")
if [ "$CURRENT_SHELL" != "zsh" ]; then
    chsh -s "$(command -v zsh)"
    echo -e "   ${GREEN}✔️ Default shell changed to Zsh. (You may need to log out and log back in)${NC}"
else
    echo -e "   ${YELLOW}✔️ Zsh is already your default shell.${NC}"
fi

echo -e "\n${GREEN}✅ [Online Step 5]: Terminal armory has been fully upgraded!${NC}\n"