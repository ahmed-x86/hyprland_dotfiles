#!/bin/bash

echo -e "\n🔥 [Step 6]: Breathing Life into the Kingdom (swww & Wallpapers)..."

USER_HOME="$HOME"
WALLPAPER_DIR="$USER_HOME/Pictures/Wallpapers"

echo -e "📦 Installing swww..."
sudo pacman -S --noconfirm swww

echo -e "📁 Preparing wallpaper directory..."
mkdir -p "$WALLPAPER_DIR"

echo -e "🖼️ Downloading royal wallpapers..."

curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/anime-red-supra-cherry-blossoms-desktop-wallpaper.jpg -o ~/Pictures/Wallpapers/anime-red-supra-cherry-blossoms-desktop-wallpaper.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/arch-linux-purple-mountain-4k-wallpaper.jpeg -o ~/Pictures/Wallpapers/arch-linux-purple-mountain-4k-wallpaper.jpeg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/arch-linux-wallpaper-4k.png -o ~/Pictures/Wallpapers/arch-linux-wallpaper-4k.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/astronaut.png -o ~/Pictures/Wallpapers/astronaut.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/audi-r8-dusk-mountain-road-desktop-wallpaper.jpg -o ~/Pictures/Wallpapers/audi-r8-dusk-mountain-road-desktop-wallpaper.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/bridge-sea-middle-mountains.jpg -o ~/Pictures/Wallpapers/bridge-sea-middle-mountains.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/deep-forest-with-wooden-stairs.png -o ~/Pictures/Wallpapers/deep-forest-with-wooden-stairs.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/eclipse.jpg -o ~/Pictures/Wallpapers/eclipse.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/fishing.png -o ~/Pictures/Wallpapers/fishing.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/flying-comets-clouds.jpg -o ~/Pictures/Wallpapers/flying-comets-clouds.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/galaxy-waves.jpg -o ~/Pictures/Wallpapers/galaxy-waves.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/girl-stars.png -o ~/Pictures/Wallpapers/girl-stars.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68b0cf5f88de0.png -o ~/Pictures/Wallpapers/hd_68b0cf5f88de0.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68bbdab92048c.jpg -o ~/Pictures/Wallpapers/hd_68bbdab92048c.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68c6d854a4598.jpg -o ~/Pictures/Wallpapers/hd_68c6d854a4598.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68c30207267cb.jpg -o ~/Pictures/Wallpapers/hd_68c30207267cb.jpg
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68ceb61e95348_(1).jpg" -o ~/Pictures/Wallpapers/hd_68ceb61e95348_1.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_68ceb798e318c.jpg -o ~/Pictures/Wallpapers/hd_68ceb798e318c.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_8850a966ef05441a95bf75ec27c4d429_683c799da9a0d.jpg -o ~/Pictures/Wallpapers/hd_8850a966ef05441a95bf75ec27c4d429_683c799da9a0d.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/hd_crop_689198abca3b2.jpg -o ~/Pictures/Wallpapers/hd_crop_689198abca3b2.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/Honkadaloonga.png -o ~/Pictures/Wallpapers/Honkadaloonga.png
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/illustration-rain-futuristic-city(1).png" -o ~/Pictures/Wallpapers/illustration-rain-futuristic-city_1.png
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/illustration-rain-futuristic-city(2).jpg" -o ~/Pictures/Wallpapers/illustration-rain-futuristic-city_2.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/illustration-rain-futuristic-city.jpg -o ~/Pictures/Wallpapers/illustration-rain-futuristic-city.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/lamborghini-rainbow-road-speed-desktop-wallpaper-4k.jpg -o ~/Pictures/Wallpapers/lamborghini-rainbow-road-speed-desktop-wallpaper-4k.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/Leonardo_Lightning_XL_It_is_midnight_the_color_is_purple_dotte_02.jpg -o ~/Pictures/Wallpapers/leonardo_lightning_purple.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/Lucid_Origin_a_cinematic_photo_of_POV_night_ride_on_a_motorcyc_0.jpg -o ~/Pictures/Wallpapers/lucid_origin_night_ride.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/porsche-coastal-drive-sunset-desktop-wallpaper-4k.jpg -o ~/Pictures/Wallpapers/porsche-coastal-drive-sunset-desktop-wallpaper-4k.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/rwb-porsche-neon-night-rain-desktop-wallpaper.jpg -o ~/Pictures/Wallpapers/rwb-porsche-neon-night-rain-desktop-wallpaper.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/sea-horizon-sky.jpg -o ~/Pictures/Wallpapers/sea-horizon-sky.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/snow-covered-mountains-northern-india.jpg -o ~/Pictures/Wallpapers/snow-covered-mountains-northern-india.jpg
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/space-piano.png -o ~/Pictures/Wallpapers/space-piano.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/wall.png -o ~/Pictures/Wallpapers/wall.png
curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/wallpaperflare.com_wallpaper.png -o ~/Pictures/Wallpapers/wallpaperflare.com_wallpaper.png
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/wallpaperflare.com_wallpaper_(6).png" -o ~/Pictures/Wallpapers/wallpaperflare_com_wallpaper_6.png
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/wallpaperflare.com_wallpaper_(7).png" -o ~/Pictures/Wallpapers/wallpaperflare_com_wallpaper_7.png
curl -fsSL "https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/main/Wallpapers/wallpaperflare.com_wallpaper_(9).png" -o ~/Pictures/Wallpapers/wallpaperflare_com_wallpaper_9.png

echo -e "✅ Wallpapers downloaded successfully."
echo -e "🎉 Setup COMPLETE for user: $USER\n"