#!/usr/bin/env bash

# Kill existing rofi if running
if pidof -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

# Check if the wallpapers directory exists
if [ ! -d "$WALLPAPERS_DIR" ]; then
    notify-send "Error" "Wallpapers directory not found!"
    exit 1
fi

# Generate the list for rofi (basename without extension + icon path)
# Added -show-icons to ensure rofi actually renders the images
selected_wallpaper=$(for wp_path in "$WALLPAPERS_DIR"/*; do
    # Ensure it is a file (skips directories if any exist inside)
    if [ -f "$wp_path" ]; then
        wp_name=$(basename "${wp_path%.*}")
        echo -en "${wp_name}\0icon\x1f${wp_path}\n"
    fi
done | rofi -dmenu -show-icons -p "  Wallpaper")

# Exit safely if the user pressed Esc or closed rofi without making a selection
if [[ -z "$selected_wallpaper" ]]; then
    exit 0
fi

# Retrieve the full path of the selected wallpaper safely
# -maxdepth 1 ensures it only searches the main folder for better performance
image_full_path=$(find "$WALLPAPERS_DIR" -maxdepth 1 -type f -name "$selected_wallpaper.*" | head -n 1)

# Apply wallpaper and effects only if the file was successfully found
if [[ -n "$image_full_path" && -f "$image_full_path" ]]; then
    
    # --- The Ultimate Magic Box (All Transitions Mixed + Bezier Curve) ---
    
    # Array of ALL cool transitions (circles, sides, wipes, waves, and fades)
    TRANSITIONS=("grow" "center" "outer" "left" "right" "top" "bottom" "wipe" "wave" "fade")
    
    # Pick a truly random transition using 'shuf'
    RANDOM_TRANSITION=$(printf "%s\n" "${TRANSITIONS[@]}" | shuf -n 1)
    
    # Pick a random duration between 1 and 3 seconds
    RANDOM_DURATION=$(( (RANDOM % 3) + 1 ))
    
    # Pick a random angle between 0 and 360 (Only affects wipe and wave)
    RANDOM_ANGLE=$(( RANDOM % 360 ))

    # Change wallpaper using awww with all the advanced random parameters
    awww img "$image_full_path" \
        --transition-type "$RANDOM_TRANSITION" \
        --transition-duration "$RANDOM_DURATION" \
        --transition-angle "$RANDOM_ANGLE" \
        --transition-fps 60 \
        --transition-bezier 0.4,0.2,0.4,1.0
    
    # Send a cool notification showing the applied wallpaper and the effect used
    notify-send -i "$image_full_path" "✨ Wallpaper Applied" "Effect: $RANDOM_TRANSITION\nDuration: ${RANDOM_DURATION}s"
    
    # Run the external effects script
    ~/.config/viegphunt/wallpaper_effects.sh

else
    notify-send "Error" "Could not load the selected wallpaper."
fi
