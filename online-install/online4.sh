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

# Wlogout
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/icons/lock.png -o "$CONFIG_DIR/wlogout/icons/lock.png"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/icons/logout.png -o "$CONFIG_DIR/wlogout/icons/logout.png"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/icons/reboot.png -o "$CONFIG_DIR/wlogout/icons/reboot.png"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/icons/shutdown.png -o "$CONFIG_DIR/wlogout/icons/shutdown.png"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/icons/suspend.png -o "$CONFIG_DIR/wlogout/icons/suspend.png"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/layout -o "$CONFIG_DIR/wlogout/layout"
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/.config/wlogout/style.css -o "$CONFIG_DIR/wlogout/style.css"



#icons
mkdir -p ~/.icons
curl -fsSL "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1482459209/papirus-icon-theme-20250501.tar.gz?response-content-disposition=attachment%3B%2520papirus-icon-theme-20250501.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20260226%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260226T111112Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=a69e8106f8b5b8e850631a80297cda498874220bf37ec25232d10154234cfc97" -o papirus-icon-theme-20250501.tar.gz
tar -xzf papirus-icon-theme-20250501.tar.gz -C ~/.icons
rm papirus-icon-theme-20250501.tar.gz

#theme

mkdir -p ~/.themes
curl -fsSL "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/tags/20240201.tar.gz" -o papirus.tar.gz

tar -xf Catppuccin-B-MB-dark.tar.xz -C ~/.themes
rm Catppuccin-B-MB-dark.tar.xz


echo -e "${GREEN}✅ All files downloaded successfully.${NC}"

echo -e "\n${CYAN}🔒 Setting execution permissions for scripts...${NC}"
chmod +x "$CONFIG_DIR/viegphunt/"*.sh 2>/dev/null || true
chmod +x "$CONFIG_DIR/waybar/"*.sh 2>/dev/null || true
chmod +x "$CONFIG_DIR/waybar/scripts/"* 2>/dev/null || true

echo -e "${GREEN}🎉 [Step 4]: Completed! Your dotfiles are ready.${NC}\n"