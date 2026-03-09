#!/usr/bin/env bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "\n${BLUE}🔥 [Step 4]: Downloading and Deploying Visual Identity Files...${NC}"

CONFIG_DIR="$HOME/.config"
BASE_URL="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config"

echo -e "\n${CYAN}📂 Creating necessary directories inside $CONFIG_DIR...${NC}"

mkdir -p "$CONFIG_DIR"/{cava,hypr/conf,kitty,nwg-look,rofi,swaync,swayosd,viegphunt,waybar/scripts/Assets,wlogout/icons,wlogout/sunset}
echo -e "${GREEN}✅ Directories created successfully.${NC}"

echo -e "\n${YELLOW}📥 Fetching dotfiles directly from GitHub... Please wait.${NC}"

DOTFILES=(
    "cava/config"
    "hypr/conf/animation.conf"
    "hypr/conf/appearance.conf"
    "hypr/conf/autostart.conf"
    "hypr/conf/environment.conf"
    "hypr/conf/input.conf"
    "hypr/conf/keybinding.conf"
    "hypr/conf/layout.conf"
    "hypr/conf/misc.conf"
    "hypr/conf/monitors.conf"
    "hypr/conf/programs.conf"
    "hypr/conf/windowrule.conf"
    "hypr/conf/workspaces.conf"
    "hypr/hyprland.conf"
    "hypr/hyprlock.conf"
    "nwg-look/config"
    "rofi/config.rasi"
    "swaync/config.json"
    "swaync/style.css"
    "swayosd/style.css"
    "viegphunt/app_launcher.sh"
    "viegphunt/clipboard_launcher.sh"
    "viegphunt/emoji_launcher.sh"
    "viegphunt/gtkthemes.sh"
    "viegphunt/key_hints.sh"
    "viegphunt/wallpaper_effects.sh"
    "viegphunt/wallpaper_random.sh"
    "viegphunt/wallpaper_select.sh"
    "waybar/scripts/hijri.sh"
    "waybar/scripts/weekly_commits"
    "waybar/config"
    "waybar/get_lang.sh"
    "waybar/style.css"
    "waybar/updates.sh"
    "wlogout/icons/ahmed.png"
    "wlogout/layout"
    "wlogout/style.css"
    "wlogout/sunset/layout"
    "wlogout/sunset/style.css"
)

for file in "${DOTFILES[@]}"; do
    echo -e "${CYAN}📥 Downloading $file...${NC}"
    curl -fsSL "$BASE_URL/$file" -o "$CONFIG_DIR/$file" || { echo -e "${RED}❌ Error downloading $file${NC}"; exit 1; }
done

echo -e "${GREEN}✅ All dotfiles downloaded successfully.${NC}"

echo -e "\n${CYAN}🎨 Installing Papirus Icon Theme...${NC}"
mkdir -p ~/.icons
curl -fsSL https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

echo -e "\n${CYAN}🎨 Installing Catppuccin Theme...${NC}"
mkdir -p ~/.themes
THEME_URL="https://github.com/catppuccin/gtk/releases/download/v1.0.3/Catppuccin-Mocha-Standard-Blue-Dark.zip"
curl -fsSL "$THEME_URL" -o /tmp/catppuccin.zip
unzip -qo /tmp/catppuccin.zip -d ~/.themes
rm /tmp/catppuccin.zip

echo -e "\n${CYAN}🖱️ Installing Oreo Blue Cursors...${NC}"
mkdir -p ~/.icons

if command -v yay &> /dev/null; then
    echo -e "${YELLOW}📥 Installing Oreo Cursors via AUR using yay...${NC}"
    yay -S --noconfirm oreo-cursors || true
    echo -e "${GREEN}✅ Oreo Cursors installed via AUR.${NC}"
else
    echo -e "${YELLOW}⚠️ 'yay' is not installed. Attempting direct clone from GitHub...${NC}"
    git clone https://github.com/varlesh/oreo-cursors.git /tmp/oreo-cursors
    echo -e "${YELLOW}💡 Note: To fully build it, you might need to run the installer inside /tmp/oreo-cursors later, or simply install yay.${NC}"
fi

echo -e "\n${CYAN}🔒 Setting execution permissions for scripts...${NC}"
find "$CONFIG_DIR/viegphunt" "$CONFIG_DIR/waybar" -type f \( -name "*.sh" -o -name "weekly_commits" \) -exec chmod +x {} \;

echo -e "${GREEN}🎉 [Step 4]: Completed! Your dotfiles are ready.${NC}\n"