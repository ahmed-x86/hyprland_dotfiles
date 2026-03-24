#!/usr/bin/env bash
set -euo pipefail

# --- Color Palette ---
PINK="\e[1;35m"
WHITE="\e[0m"
YELLOW="\e[1;33m"
GREEN="\e[1;32m"
RED="\e[1;31m"
CYAN="\e[1;36m"

start_time=$(date +%s)
clear

# --- Header & Disclaimer ---
echo -e "${PINK}**********************************************************************"
echo -e "* ${RED}ATTENTION:${PINK} Ahmed's Hyprland Dotfiles Deployment Tool               *"
echo -e "* This script will automate your setup and install dependencies.     *"
echo -e "**********************************************************************${WHITE}\n"

# ==========================================
# Pre-flight Checks (OS & GPU)
# ==========================================
echo -e "${CYAN}🔍 Running Pre-flight Checks...${WHITE}"

# 1. OS Check: Ensure it's Arch Linux
if [[ ! -f "/etc/arch-release" ]]; then
    echo -e "${RED}![Error]: This script is designed for Arch Linux only!${WHITE}"
    exit 1
fi
echo -e "   ${GREEN}✔️ Arch Linux detected.${WHITE}"

# 2. GPU Check: Detect NVIDIA for Hyprland compatibility
if lspci | grep -iE 'vga|3d' | grep -qi 'nvidia'; then
    echo -e "   ${YELLOW}⚠️ NVIDIA GPU detected. Special Hyprland environment variables will be needed.${WHITE}"
    export HYPRLAND_NVIDIA_DETECTED=1
else
    echo -e "   ${GREEN}✔️ Non-NVIDIA GPU detected (AMD/Intel).${WHITE}"
    export HYPRLAND_NVIDIA_DETECTED=0
fi
echo -e "------------------------------------------------------\n"

# Grant execution permissions to all steps upfront
chmod +x step*.sh 2>/dev/null || true

# Initialize the tracking file if it's missing
if [[ ! -f "steps.txt" ]]; then
    echo "1" > steps.txt
fi

while true; do
    current_step=$(cat steps.txt 2>/dev/null | xargs || echo "1")

    if [[ "$current_step" == "8" ]]; then
        break
    fi

    if [[ ! "$current_step" =~ ^[1-7]$ ]]; then
        echo -e "${RED}![Error]: Invalid step number found in steps.txt: ${current_step}${WHITE}"
        exit 1
    fi

    script_name="step${current_step}.sh"

    if [[ ! -f "$script_name" ]]; then
        echo -e "${RED}![Error]: Missing file: ${script_name}${WHITE}"
        exit 1
    fi

    echo -e "${CYAN}🚀 [Step ${current_step}/7]${WHITE} Executing: ${YELLOW}${script_name}...${WHITE}"

    if ! bash "$script_name" 2>&1 | tee .temp_log.txt; then
        echo -e "\n${RED}✘ Oops! Something went wrong in ${script_name}.${WHITE}"
        
        {
            echo "--- Failure in ${script_name} at $(date) ---"
            cat .temp_log.txt
            echo -e "------------------------------------------\n"
        } >> error_log.txt
        
        rm -f .temp_log.txt
        echo -e "${YELLOW}Please check '${RED}error_log.txt${YELLOW}' to see what happened.${WHITE}"
        exit 1
    fi

    rm -f .temp_log.txt
    
    next_step=$((current_step + 1))
    echo "$next_step" > steps.txt
    
    echo -e "${GREEN}✔ ${script_name} completed successfully.${WHITE}\n"
done

# --- Final Stats ---
end_time=$(date +%s)
duration=$((end_time - start_time))
printf -v formatted_time "%02d:%02d:%02d" $((duration/3600)) $(((duration%3600)/60)) $((duration%60))

echo -e "${PINK}=========================================${WHITE}"
echo -e "${CYAN}Total Time Elapsed: ${formatted_time}${WHITE}"
echo -e "${PINK}=========================================${WHITE}"
echo -e "\n${GREEN}✨ Mission complete! Your Hyprland environment is ready.${WHITE}\n"