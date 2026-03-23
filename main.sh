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
echo -e "* ${RED}ATTENTION:${PINK} Ahmed's Hyprland Dotfiles Deployment Tool              *"
echo -e "* This script will automate your setup and install dependencies.    *"
echo -e "* Please ensure you have a backup of your current configurations.    *"
echo -e "**********************************************************************${WHITE}\n"

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
    if ! bash "$script_name" 2>&1 | tee .temp_log.txt; then
        echo -e "\n${RED}✘ Oops! Something went wrong in ${script_name}.${WHITE}"
        
        # Log the failure with a timestamp
        {
            echo "--- Failure in ${script_name} at $(date) ---"
            cat .temp_log.txt
            echo -e "------------------------------------------\n"
        } >> error_log.txt
        
        rm -f .temp_log.txt
        echo -e "${YELLOW}Please check '${RED}error_log.txt${YELLOW}' to see what happened.${WHITE}"
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