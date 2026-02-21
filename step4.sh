#!/bin/bash

echo -e "\n🔥 [Step 4]: Deploying The Royal Dotfiles (Visual Identity)..."

USER_HOME="$HOME"
CONFIG_DIR="$USER_HOME/.config"

echo -e "📂 Ensuring target directories exist..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$USER_HOME/Pictures"

echo -e "🔄 Copying all configurations (Hyprland, Waybar, etc.) to $CONFIG_DIR..."
cp -a .config/. "$CONFIG_DIR/"

echo -e "🎨 Copying Themes, Icons, and Wallpapers..."
cp -a .icons "$USER_HOME/" 2>/dev/null
cp -a .themes "$USER_HOME/" 2>/dev/null
cp -a Wallpapers "$USER_HOME/Pictures/" 2>/dev/null

echo -e "🔒 Setting execution permissions for custom scripts..."
chmod +x "$CONFIG_DIR/waybar/scripts/"* 2>/dev/null
chmod +x "$CONFIG_DIR/hypr/scripts/"* 2>/dev/null

echo -e "✅ [Step 4]: Visual identity applied successfully for user: $USER!\n"