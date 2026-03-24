#!/usr/bin/env bash

# Enable maximum strictness (E ensures traps are inherited by functions)
set -Eeuo pipefail

# --- Color Palette ---
PINK="\e[1;35m"
WHITE="\e[0m"
YELLOW="\e[1;33m"
GREEN="\e[1;32m"
RED="\e[1;31m"
CYAN="\e[1;36m"

# --- Black Box Logger (Error Handler) ---
ERROR_LOG="error_log.txt"
touch "$ERROR_LOG"

error_handler() {
    local exit_code=$?
    local failed_command=$BASH_COMMAND
    local error_details=$(caller 0)
    local line_number=$(echo "$error_details" | awk '{print $1}')
    local file_name=$(echo "$error_details" | awk '{print $2}')

    echo -e "\n${RED}===================================================${WHITE}"
    echo -e "${RED}[CRITICAL ERROR] The deployment tool encountered a fatal issue!${WHITE}"
    echo -e "📂 File: ${YELLOW}$file_name${WHITE}"
    echo -e "📍 Line: ${YELLOW}$line_number${WHITE}"
    echo -e "💥 Failed Command: ${YELLOW}$failed_command${WHITE}"
    echo -e "🔢 Exit Code: ${YELLOW}$exit_code${WHITE}"
    echo -e "${RED}===================================================${WHITE}\n"

    {
        echo "========================================"
        echo "CRASH REPORT"
        echo "========================================"
        echo "Date & Time    : $(date '+%Y-%m-%d %H:%M:%S')"
        echo "File           : $file_name"
        echo "Line Number    : $line_number"
        echo "Failed Command : $failed_command"
        echo "Exit Code      : $exit_code"
        echo "User           : $USER"
        echo "========================================"
        echo ""
    } >> "$ERROR_LOG"

    echo -e "${YELLOW}Detailed crash report saved to: ${RED}$ERROR_LOG${WHITE}"
    exit "$exit_code"
}

# Trap any unhandled errors, interruptions (Ctrl+C), or termination signals
trap 'error_handler' ERR SIGINT SIGTERM


start_time=$(date +%s)
clear

# --- Header & Disclaimer ---
echo -e "${PINK}**********************************************************************"
echo -e "* ${RED}ATTENTION:${PINK} Ahmed's Hyprland Dotfiles Deployment Tool               *"
echo -e "* This script will automate your setup and install dependencies.     *"
echo -e "* Please ensure you have a backup of your current configurations.    *"
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
    # Read the current step safely
    current_step=$(cat steps.txt 2>/dev/null | xargs || echo "1")

    # Exit condition: Stop after Step 7 completes
    if [[ "$current_step" == "8" ]]; then
        break
    fi

    # Validate step range (1-7)
    if [[ ! "$current_step" =~ ^[1-7]$ ]]; then
        echo -e "${RED}![Error]: Invalid step number found in steps.txt: ${current_step}${WHITE}"
        echo -e "${YELLOW}Hint: Try resetting steps.txt to '1'.${WHITE}"
        exit 1
    fi

    script_name="step${current_step}.sh"

    # Check if the script for the current step actually exists
    if [[ ! -f "$script_name" ]]; then
        echo -e "${RED}![Error]: Missing file: ${script_name}${WHITE}"
        echo -e "Make sure all 7 step scripts are in the same directory."
        exit 1
    fi

    echo -e "${CYAN}🚀 [Step ${current_step}/7]${WHITE} Executing: ${YELLOW}${script_name}...${WHITE}"

    # Execute the step and log output/errors
    # Note: Because we handle the failure with 'if ! ...', the global trap won't fire here, 
    # which is intended behavior so we can capture the specific step log.
    if ! bash "$script_name" 2>&1 | tee .temp_log.txt; then
        echo -e "\n${RED}✘ Oops! Something went wrong in ${script_name}.${WHITE}"
        
        # Log the child script failure with a timestamp
        {
            echo "--- Child Script Failure: ${script_name} at $(date) ---"
            cat .temp_log.txt
            echo -e "------------------------------------------\n"
        } >> "$ERROR_LOG"
        
        rm -f .temp_log.txt
        echo -e "${YELLOW}Please check '${RED}$ERROR_LOG${YELLOW}' to see what happened.${WHITE}"
        exit 1
    fi

    # Cleanup temp log and increment step
    rm -f .temp_log.txt
    
    next_step=$((current_step + 1))
    echo "$next_step" > steps.txt
    
    echo -e "${GREEN}✔ ${script_name} completed successfully.${WHITE}\n"
done

# --- Final Stats ---
end_time=$(date +%s)
duration=$((end_time - start_time))

# Format duration into HH:MM:SS
printf -v formatted_time "%02d:%02d:%02d" $((duration/3600)) $(((duration%3600)/60)) $((duration%60))

echo -e "${PINK}=========================================${WHITE}"
echo -e "${CYAN}Total Time Elapsed: ${formatted_time}${WHITE}"
echo -e "${PINK}=========================================${WHITE}"
echo -e "\n${GREEN}✨ Mission complete! Your Hyprland environment is ready.${WHITE}\n"