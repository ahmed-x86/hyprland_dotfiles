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


mkdir -p "$CONFIG_DIR"/{cava,hypr/conf,hypr/scripts,hypr/sounds,kitty,nwg-look,rofi,swaync,swayosd,viegphunt,waybar/scripts/Assets,wlogout/icons,wlogout/sunset}
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
    "hypr/hypridle.conf"
    "hypr/hyprland.conf"
    "hypr/hyprlock.conf"
    "hypr/scripts/startup_sound.sh"
    "hypr/scripts/sunset-osd.sh"
    "hypr/sounds/47313572-soft-startup-sound-269291.mp3"
    "hypr/sounds/elementary_stereo_audio-volume-change.wav"
    "hypr/sounds/freesound_community-retro-audio-logo-94648.mp3"
    "hypr/sounds/snorcon-low-battery-charge-421814.mp3"
    "hypr/sounds/spinopel-insert-charging-cable-into-smartphone-393115.mp3"
    "hypr/sounds/universfield-smooth-gadget-activation-sound-250072.mp3"
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
    "waybar/scripts/Assets/dark.png"
    "waybar/scripts/Assets/image-1.png"
    "waybar/scripts/Assets/image-2.png"
    "waybar/scripts/Assets/image.png"
    "waybar/scripts/Assets/white.png"
    "waybar/scripts/hijri_waybar.py"
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



echo -e "\n${CYAN}🔒 Setting execution permissions for scripts...${NC}"

find "$CONFIG_DIR/viegphunt" "$CONFIG_DIR/waybar" "$CONFIG_DIR/hypr/scripts" -type f \( -name "*.sh" -o -name "*.py" -o -name "weekly_commits" \) -exec chmod +x {} \;

echo -e "${GREEN}🎉 [Step 4]: Completed! Your dotfiles are ready.${NC}\n"