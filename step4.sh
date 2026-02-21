#!/bin/bash

echo -e "\n🔥 [Step 4]: Deploying The Royal Dotfiles (Visual Identity)..."

USER_HOME="$HOME"
CONFIG_DIR="$USER_HOME/.config"

echo -e "📂 Ensuring target directories exist..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$USER_HOME/Pictures"

echo -e "🔄 Copying all configurations (Hyprland, Waybar, etc.) to $CONFIG_DIR..."
cp -a .config/. "$CONFIG_DIR/"


echo -e "🎨 Applying custom Themes, Icons, and Wallpapers..."

if [ -d ".icons" ]; then
    cp -r .icons "$USER_HOME/"
    echo "   ✔️ Icons applied successfully."
fi

if [ -d ".themes" ]; then
    cp -r .themes "$USER_HOME/"
    echo "   ✔️ Themes applied successfully."
fi

if [ -d "Wallpapers" ]; then
    cp -r Wallpapers "$USER_HOME/Pictures/"
    echo "   ✔️ Wallpapers copied to $USER_HOME/Pictures."
fi

echo -e "🔒 Setting execution permissions for custom scripts..."
chmod +x "$CONFIG_DIR/waybar/scripts/"* 2>/dev/null
chmod +x "$CONFIG_DIR/hypr/scripts/"* 2>/dev/null

echo -e "✅ [Step 4]: Visual identity applied successfully for user: $USER!\n"