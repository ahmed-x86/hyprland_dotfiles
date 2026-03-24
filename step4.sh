#!/bin/bash
set -euo pipefail

echo -e "\n🔥 [Step 4]: Deploying The Royal Dotfiles (Visual Identity)..."

USER_HOME="$HOME"
CONFIG_DIR="$USER_HOME/.config"
BACKUP_DIR="$USER_HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "📂 Ensuring target directories exist..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$USER_HOME/Pictures"

# --- Backup System ---
echo -e "🛡️ Checking for existing configurations to backup..."
if [ -d "$CONFIG_DIR/hypr" ] || [ -d "$CONFIG_DIR/waybar" ]; then
    mkdir -p "$BACKUP_DIR"
    echo -e "   📦 Backing up old configs to: $BACKUP_DIR"
    [ -d "$CONFIG_DIR/hypr" ] && cp -r "$CONFIG_DIR/hypr" "$BACKUP_DIR/"
    [ -d "$CONFIG_DIR/waybar" ] && cp -r "$CONFIG_DIR/waybar" "$BACKUP_DIR/"
fi
# ---------------------

echo -e "🔄 Copying all new configurations to $CONFIG_DIR..."
cp -a .config/. "$CONFIG_DIR/"


echo -e "🎨 Applying custom Themes, Icons, and Wallpapers..."
if [ -d ".icons" ]; then cp -r .icons "$USER_HOME/"; echo "   ✔️ Icons applied."; fi
if [ -d ".themes" ]; then cp -r .themes "$USER_HOME/"; echo "   ✔️ Themes applied."; fi
if [ -d "Wallpapers" ]; then cp -r Wallpapers "$USER_HOME/Pictures/"; echo "   ✔️ Wallpapers copied."; fi

echo -e "🔒 Setting execution permissions for custom scripts..."
chmod +x "$CONFIG_DIR/waybar/scripts/"* 2>/dev/null || true
chmod +x "$CONFIG_DIR/hypr/scripts/"* 2>/dev/null || true

echo -e "✅ [Step 4]: Visual identity applied successfully for user: $USER!\n"