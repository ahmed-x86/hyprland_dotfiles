#!/usr/bin/env bash

# Kill existing rofi if running
if pidof -x rofi > /dev/null; then
    pkill -x rofi
fi

# Get selection
selection=$(cliphist list | rofi -dmenu -p "Clipboard")

# Only decode and copy if selection is not empty
if [[ -n "$selection" ]]; then
    echo "$selection" | cliphist decode | wl-copy
fi
