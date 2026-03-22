#!/usr/bin/env bash

# Set directories and paths
DEST_DIR="$HOME/.cache/swww"
THUMB_PATH="$DEST_DIR/normal.png"

# Ensure the cache directory exists
mkdir -p "$DEST_DIR"

# Get the current wallpaper path from swww
# We use awk directly to extract the first valid image path
CURRENT_WALLPAPER=$(swww query | awk -F'image: ' '/image:/ {print $2; exit}')

# Safety Check 1: Ensure swww returned a path, and the file actually exists
if [[ -z "$CURRENT_WALLPAPER" || ! -f "$CURRENT_WALLPAPER" ]]; then
    # Silently exit or log error if no wallpaper is set
    exit 1
fi

# Remove the old thumbnail safely
rm -f "$THUMB_PATH"

# Safety Check 2: Ensure vipsthumbnail is installed before running
if command -v vipsthumbnail &> /dev/null; then
    # Generate the thumbnail (vipsthumbnail is blazing fast)
    # Tip: You can append `--size 512x512` if you want a specific dimension
    vipsthumbnail "$CURRENT_WALLPAPER" -o "$THUMB_PATH"
elif command -v magick &> /dev/null; then
    # Fallback to ImageMagick if vipsthumbnail is missing
    magick "$CURRENT_WALLPAPER" -thumbnail 512x512 "$THUMB_PATH"
else
    # Ultimate fallback: Just copy the image if no thumbnail tools exist
    cp "$CURRENT_WALLPAPER" "$THUMB_PATH"
fi