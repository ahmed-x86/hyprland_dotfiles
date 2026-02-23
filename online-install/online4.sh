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
