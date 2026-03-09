#!/usr/bin/env bash

set -euo pipefail

echo -e "\n🔥 [Step 6]: Breathing Life into the Kingdom (swww & Wallpapers)..."

USER_HOME="$HOME"
WALLPAPER_DIR="$USER_HOME/Pictures/Wallpapers"

echo -e "📁 Preparing wallpaper directory..."
mkdir -p "$WALLPAPER_DIR"

WALLPAPERS=(
    "anime-red-supra-cherry-blossoms-desktop-wallpaper.jpg"
    "arch-linux-purple-mountain-4k-wallpaper.jpeg"
    "arch-linux-wallpaper-4k.png"
    "astronaut.png"
    "audi-r8-dusk-mountain-road-desktop-wallpaper.jpg"
    "bridge-sea-middle-mountains.jpg"
    "deep-forest-with-wooden-stairs.png"
    "eclipse.jpg"
    "fishing.png"
    "flying-comets-clouds.jpg"
    "galaxy-waves.jpg"
    "girl-stars.png"
    "hd_68b0cf5f88de0.png"
    "hd_68bbdab92048c.jpg"
    "hd_68c6d854a4598.jpg"
    "hd_68c30207267cb.jpg"
    "hd_68ceb61e95348_(1).jpg"
    "hd_68ceb798e318c.jpg"
    "hd_8850a966ef05441a95bf75ec27c4d429_683c799da9a0d.jpg"
    "hd_crop_689198abca3b2.jpg"
    "Honkadaloonga.png"
    "illustration-rain-futuristic-city(1).png"
    "illustration-rain-futuristic-city(2).jpg"
    "illustration-rain-futuristic-city.jpg"
    "lamborghini-rainbow-road-speed-desktop-wallpaper-4k.jpg"
    "Leonardo_Lightning_XL_It_is_midnight_the_color_is_purple_dotte_02.jpg"
    "Lucid_Origin_a_cinematic_photo_of_POV_night_ride_on_a_motorcyc_0.jpg"
    "porsche-coastal-drive-sunset-desktop-wallpaper-4k.jpg"
    "rwb-porsche-neon-night-rain-desktop-wallpaper.jpg"
    "sea-horizon-sky.jpg"
    "snow-covered-mountains-northern-india.jpg"
    "space-piano.png"
    "wall.png"
    "wallpaperflare.com_wallpaper.png"
    "wallpaperflare.com_wallpaper_(6).png"
    "wallpaperflare.com_wallpaper_(7).png"
    "wallpaperflare.com_wallpaper_(9).png"
)


echo -e "🖼️ Downloading royal wallpapers..."
BASE_URL="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers"
for wallpaper in "${WALLPAPERS[@]}"; do
    curl -fsSL "$BASE_URL/$wallpaper" -o "$WALLPAPER_DIR/$wallpaper" || {
        echo -e "❌ Failed to download $wallpaper"
        continue
    }
done

echo -e "✅ Wallpapers downloaded successfully."

echo -e "🎨 Checking display environment..."
DEFAULT_WALLPAPER="rwb-porsche-neon-night-rain-desktop-wallpaper.jpg"


if [ -n "${WAYLAND_DISPLAY:-}" ]; then
    echo -e "👁️ Wayland session detected. Applying wallpaper via swww..."
    
    swww query >/dev/null 2>&1 || swww-daemon >/dev/null 2>&1 &

    timeout=0
    while ! swww query >/dev/null 2>&1; do
        sleep 0.5
        timeout=$((timeout + 1))
        if [ $timeout -ge 10 ]; then
            echo -e "⚠️ Warning: swww-daemon took too long to start."
            break
        fi
    done

    swww img "$WALLPAPER_DIR/$DEFAULT_WALLPAPER" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-step 90
        
    echo -e "✅ Wallpaper applied directly."
else
    echo -e "ℹ️ TTY / Non-Wayland environment detected."
    echo -e "ℹ️ Wallpapers are ready and will be applied automatically when you launch Hyprland."
fi

echo -e "🎉 Setup COMPLETE for user: $USER\n"