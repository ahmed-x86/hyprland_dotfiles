#!/usr/bin/env bash

WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

# Check if the wallpapers directory exists
if [ ! -d "$WALLPAPERS_DIR" ]; then
    notify-send "Error" "Wallpapers directory not found!"
    exit 1
fi

# Pick a random wallpaper quickly and safely
random_wallpaper=$(find "$WALLPAPERS_DIR" -maxdepth 1 -type f | shuf -n 1)

# Ensure a file was actually found
if [[ -n "$random_wallpaper" && -f "$random_wallpaper" ]]; then
    
    # --- The Ultimate Magic Box (All Transitions Mixed + Bezier Curve) ---
    
    # Array of ALL cool transitions
    TRANSITIONS=("grow" "center" "outer" "left" "right" "top" "bottom" "wipe" "wave" "fade")
    
    # Pick a truly random transition using 'shuf'
    RANDOM_TRANSITION=$(printf "%s\n" "${TRANSITIONS[@]}" | shuf -n 1)
    
    # Pick a random duration between 1 and 3 seconds
    RANDOM_DURATION=$(( (RANDOM % 3) + 1 ))
    
    # Pick a random angle between 0 and 360 (Only affects wipe and wave)
    RANDOM_ANGLE=$(( RANDOM % 360 ))

    # Change wallpaper using swww with all the advanced random parameters
    swww img "$random_wallpaper" \
        --transition-type "$RANDOM_TRANSITION" \
        --transition-duration "$RANDOM_DURATION" \
        --transition-angle "$RANDOM_ANGLE" \
        --transition-fps 60 \
        --transition-bezier 0.4,0.2,0.4,1.0
    
    # Send a cool notification showing the applied wallpaper and the effect used
    notify-send -i "$random_wallpaper" "✨ Random Wallpaper Applied" "Effect: $RANDOM_TRANSITION\nDuration: ${RANDOM_DURATION}s"
    
    # Run the external effects script
    ~/.config/viegphunt/wallpaper_effects.sh

else
    notify-send "Error" "Could not find any wallpapers to apply."
fi