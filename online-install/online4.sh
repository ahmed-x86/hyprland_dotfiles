#!/usr/bin/env bash
set -e

# الألوان للتنسيق
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "\n${BLUE}🔥 [Step 4]: Downloading and Deploying Visual Identity Files...${NC}"

# مجلد الـ .config في الـ home
CONFIG_DIR="$HOME/.config"

echo -e "\n${CYAN}📂 Creating necessary directories inside $CONFIG_DIR...${NC}"
mkdir -p \
"$CONFIG_DIR/cava" \
"$CONFIG_DIR/hypr/conf" \
"$CONFIG_DIR/nwg-look" \
"$CONFIG_DIR/rofi" \
"$CONFIG_DIR/swaync" \
"$CONFIG_DIR/swayosd" \
"$CONFIG_DIR/viegphunt" \
"$CONFIG_DIR/waybar/scripts" \
"$CONFIG_DIR/wlogout/icons"

echo -e "${GREEN}✅ Directories created successfully.${NC}"

echo -e "\n${YELLOW}📥 Fetching dotfiles directly from GitHub... Please wait.${NC}"

# Cava
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/cava/config -o "$CONFIG_DIR/cava/config"

# Hyprland
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/animation.conf -o "$CONFIG_DIR/hypr/conf/animation.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/appearance.conf -o "$CONFIG_DIR/hypr/conf/appearance.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/autostart.conf -o "$CONFIG_DIR/hypr/conf/autostart.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/environment.conf -o "$CONFIG_DIR/hypr/conf/environment.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/input.conf -o "$CONFIG_DIR/hypr/conf/input.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/keybinding.conf -o "$CONFIG_DIR/hypr/conf/keybinding.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/layout.conf -o "$CONFIG_DIR/hypr/conf/layout.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/misc.conf -o "$CONFIG_DIR/hypr/conf/misc.conf"