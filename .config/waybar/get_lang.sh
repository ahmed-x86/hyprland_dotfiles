#!/bin/bash
layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | head -n 1)

if [[ "$layout" == *"Arabic"* ]]; then
    echo "AR"
elif [[ "$layout" == *"English"* ]]; then
    echo "EN"
else
    echo "${layout:0:2}" | tr '[:lower:]' '[:upper:]'
fi
