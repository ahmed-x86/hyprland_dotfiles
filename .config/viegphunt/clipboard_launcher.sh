#!/usr/bin/env bash

# Kill existing rofi if running
if pidof -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

# Create a temporary directory for clipboard images
TMP_DIR="/tmp/cliphist_images"
mkdir -p "$TMP_DIR"

# Read clipboard history and format the output
selection=$(cliphist list | while IFS=$'\t' read -r id data; do
    
    # Check if the clipboard item is an image (binary data)
    if [[ "$data" == *"[[ binary"* ]]; then
        # Extract size and format (4th, 5th, and 6th words)
        # Original string format: [[ binary data 54 KB jpeg ]]
        info=$(echo "$data" | awk '{print $4, $5, "(" $6 ")"}')
        
        img_path="$TMP_DIR/${id}.png"
        
        # Decode and save the image if it doesn't already exist in the temp folder
        if [ ! -f "$img_path" ]; then
            echo -e "${id}\t${data}" | cliphist decode > "$img_path" 2>/dev/null
        fi
        
        # Send the formatted string to rofi with the image icon
        echo -en "${id}\t🖼️  Image: ${info}\0icon\x1f${img_path}\n"
    else
        # Send regular text as is
        echo -en "${id}\t${data}\n"
    fi
done | rofi -dmenu -show-icons -p "Clipboard")

# If the user made a selection, decode it and copy it to the current clipboard
if [[ -n "$selection" ]]; then
    echo "$selection" | cliphist decode | wl-copy
fi
