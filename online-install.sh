#!/usr/bin/env bash
set -euo pipefail

PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
RED="\e[31m"

start_time=$(date +%s)

echo -e "${PINK}
 **********************************************************************
 * ⚠️  \e[1;4mWARNING\e[0m${PINK}:                                     *
 * This script will modify your system!                               *
 * It will install Hyprland and several dependencies.                 *
 * Make sure you know what you are doing before continuing.           *
 **********************************************************************
\n${WHITE}"

if [[ ! -f "steps.txt" ]]; then
    echo "1" > steps.txt
fi

while true; do
    read -r current_step < steps.txt
    current_step=$(echo "$current_step" | xargs)

    if [[ "$current_step" == "7" ]]; then
        break
    fi

    if [[ ! "$current_step" =~ ^[1-6]$ ]]; then
        echo -e "${RED}Error: steps.txt contains an invalid number: ${current_step}${WHITE}"
        exit 1
    fi

    script_name="online${current_step}.sh"
    script_url="https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/refs/heads/main/online-install/${script_name}"

    echo -e "${YELLOW}==> Fetching & Running ${script_name} online...${WHITE}"

    if ! script_content=$(curl -fsSL "$script_url"); then
        echo -e "\n${RED}Error: Could not fetch ${script_name} (404 Not Found or Network Error)${WHITE}"
        exit 1
    fi

    if ! bash -c "$script_content" 2>&1 | tee .temp_log.txt; then
        echo -e "\n${RED}${script_name} has encountered an error during execution${WHITE}"
        
        echo "--- Error in ${script_name} at $(date) ---" >> error_log.txt
        cat .temp_log.txt >> error_log.txt
        echo -e "\n" >> error_log.txt
        
        rm -f .temp_log.txt
        
        echo -e "${YELLOW}Please check 'error_log.txt' for the exact error message.${WHITE}"
        exit 1
    fi

    rm -f .temp_log.txt

    next_step=$((current_step + 1))
    echo "$next_step" > steps.txt
    
    echo -e "${GREEN}${script_name} finished successfully.${WHITE}\n"
done

end_time=$(date +%s)
duration=$((end_time - start_time))

hours=$((duration / 3600))
minutes=$(((duration % 3600) / 60))
seconds=$((duration % 60))

printf -v formatted_time "%02d:%02d:%02d" "$hours" "$minutes" "$seconds"

echo -e "${PINK}=========================================${WHITE}"
echo -e "${GREEN}Time elapsed: ${formatted_time}${WHITE}"
echo -e "${PINK}=========================================${WHITE}"
echo -e "\n${GREEN}\e[1mmission complete\e[0m\n"