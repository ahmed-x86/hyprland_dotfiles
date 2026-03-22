#!/usr/bin/env bash

# Kill existing yad if running to avoid multiples
if pidof yad > /dev/null; then
    pkill yad
fi

# Define the Hint List
yad --center --title="Hyprland Keybinding Master List" --no-buttons --list \
    --column="Key Combination" --column=" " --column="Action Description" \
    --timeout-indicator=bottom --width=600 --height=500 \
"󰣇  SUPER (Mod)"    " ➜ "  "Main Action Key" \
"──────────────"    "───"  "──────────────────────────" \
"󰞷  Launchers"      " "    " " \
"SUPER + Space"     " ➜ "  "Open Terminal" \
"ALT + Space"       " ➜ "  "App Launcher (Rofi)" \
"SUPER + B"         " ➜ "  "Open Web Browser" \
"SUPER + E"         " ➜ "  "Open File Manager" \
"SUPER + PERIOD"    " ➜ "  "Emoji Selector" \
"SUPER + V"         " ➜ "  "Clipboard History" \
"──────────────"    "───"  "──────────────────────────" \
"󰹑  Screenshots"    " "    " " \
"SUPER + S"         " ➜ "  "Region Screenshot (Swappy)" \
"SUPER + SHIFT + S" " ➜ "  "Full Screenshot (Grim)" \
"SUPER + A"         " ➜ "  "Color Picker (Hyprpicker)" \
"──────────────"    "───"  "──────────────────────────" \
"󰖲  Windows"       " "    " " \
"SUPER + Q"         " ➜ "  "Close Active Window" \
"SUPER + F"         " ➜ "  "Toggle Floating Mode" \
"SUPER + P"         " ➜ "  "Pseudo Mode (Dwindle)" \
"SUPER + R"         " ➜ "  "Toggle Split (Dwindle)" \
"SUPER + H/J/K/L"   " ➜ "  "Focus Movement (Vim Keys)" \
"──────────────"    "───"  "──────────────────────────" \
"󰠚  System"        " "    " " \
"SUPER + L"         " ➜ "  "Lock Screen (Hyprlock)" \
"SUPER + W"         " ➜ "  "Choose Wallpaper" \
"SUPER + SHIFT + W" " ➜ "  "Random Wallpaper" \
"SUPER + F5 / F6"   " ➜ "  "Sunset (Blue Light Filter)" \
"SUPER + SHIFT + R" " ➜ "  "Reload Hyprland Config" \
"SUPER + CTRL + ESC" " ➜ " "Exit Hyprland (Logout)" \
"──────────────"    "───"  "──────────────────────────" \
"󰔊  Workspaces"    " "    " " \
"SUPER + [1-0]"     " ➜ "  "Switch to Workspace 1-10" \
"SUPER + SHIFT+[1-0]" " ➜ " "Move Window to Workspace" \
"SUPER + TAB"       " ➜ "  "Previous Workspace" \
"" "" "" \
"Full Config:"      " ➜ "  "~/.config/hypr/conf/keybinding.conf"