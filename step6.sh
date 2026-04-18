#!/bin/bash

echo -e "\n🔥 [Step 6]: Breathing Life into the Kingdom (awww & Wallpapers)..."

USER_HOME="$HOME"
WALLPAPER_DIR="$USER_HOME/Pictures/Wallpapers"

echo -e "📦 Installing awww..."
sudo pacman -S --noconfirm awww

echo -e "🖼️  Scanning the royal armory for wallpapers..."

if [ -d "$WALLPAPER_DIR" ]; then
    WALLPAPER_COUNT=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f | wc -l)
    echo -e "   ✔️ The armory is loaded! Found $WALLPAPER_COUNT masterpiece(s) in $WALLPAPER_DIR."
elif [ -d "$USER_HOME/Pictures" ]; then
    WALLPAPER_COUNT=$(find "$USER_HOME/Pictures" -maxdepth 1 -type f | wc -l)
    echo -e "   ✔️ Found $WALLPAPER_COUNT image(s) in $USER_HOME/Pictures."
else
    echo -e "   ⚠️ No Pictures directory found."
fi

echo -e "✅ [Step 6]: The visual soul of the Kingdom is fully prepared for user: $USER!\n"
echo -e "🎉 CONGRATULATIONS! The Arch Linux Party setup is COMPLETE! 🎉\n"