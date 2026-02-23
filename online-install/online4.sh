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
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/monitors.conf -o "$CONFIG_DIR/hypr/conf/monitors.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/programs.conf -o "$CONFIG_DIR/hypr/conf/programs.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/windowrule.conf -o "$CONFIG_DIR/hypr/conf/windowrule.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/conf/workspaces.conf -o "$CONFIG_DIR/hypr/conf/workspaces.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/hyprland.conf -o "$CONFIG_DIR/hypr/hyprland.conf"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/hypr/hyprlock.conf -o "$CONFIG_DIR/hypr/hyprlock.conf"

# NWG-Look & Rofi
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/nwg-look/config -o "$CONFIG_DIR/nwg-look/config"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/rofi/config.rasi -o "$CONFIG_DIR/rofi/config.rasi"

# SwayNC & SwayOSD
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/swaync/config.json -o "$CONFIG_DIR/swaync/config.json"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/swaync/style.css -o "$CONFIG_DIR/swaync/style.css"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/swayosd/style.css -o "$CONFIG_DIR/swayosd/style.css"

# Viegphunt Scripts
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/app_launcher.sh -o "$CONFIG_DIR/viegphunt/app_launcher.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/clipboard_launcher.sh -o "$CONFIG_DIR/viegphunt/clipboard_launcher.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/emoji_launcher.sh -o "$CONFIG_DIR/viegphunt/emoji_launcher.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/gtkthemes.sh -o "$CONFIG_DIR/viegphunt/gtkthemes.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/key_hints.sh -o "$CONFIG_DIR/viegphunt/key_hints.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/wallpaper_effects.sh -o "$CONFIG_DIR/viegphunt/wallpaper_effects.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/wallpaper_random.sh -o "$CONFIG_DIR/viegphunt/wallpaper_random.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/viegphunt/wallpaper_select.sh -o "$CONFIG_DIR/viegphunt/wallpaper_select.sh"

# Waybar
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/scripts/.env -o "$CONFIG_DIR/waybar/scripts/.env"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/scripts/hijri.sh -o "$CONFIG_DIR/waybar/scripts/hijri.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/scripts/weekly_commits -o "$CONFIG_DIR/waybar/scripts/weekly_commits"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/config -o "$CONFIG_DIR/waybar/config"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/get_lang.sh -o "$CONFIG_DIR/waybar/get_lang.sh"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/style.css -o "$CONFIG_DIR/waybar/style.css"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/waybar/updates.sh -o "$CONFIG_DIR/waybar/updates.sh"
