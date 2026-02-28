#!/usr/bin/env bash
set -euo pipefail

PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
RED="\e[31m"

start_time=$(date +%s)

clear

echo -e "${PINK}
 **********************************************************************
 *     \e[1;4mWARNING\e[0m${PINK}:                                    *
 *                       this my hyprland dotfiles                    *
 *       the script well install hyprland and dependencies            *
 *              make sure to take backup for your old config          *
 **********************************************************************
\n${WHITE}"

chmod +x step*.sh 2>/dev/null || true


if [[ ! -f "steps.txt" ]]; then
    echo "1" > steps.txt
fi


while true; do
    current_step=$(cat steps.txt | xargs)

    
    if [[ "$current_step" == "7" ]]; then
        break
    fi

    if [[ ! "$current_step" =~ ^[1-6]$ ]]; then
        echo -e "${RED}Error: steps.txt contains an invalid number: ${current_step}${WHITE}"
        exit 1
    fi

    script_name="step${current_step}.sh"

    if [[ ! -f "$script_name" ]]; then
        echo -e "${RED}Error: ${script_name} not found!${WHITE}"
        exit 1
    fi

    echo -e "${YELLOW}==> Running ${script_name}...${WHITE}"


    if ! bash "$script_name" 2>&1 | tee .temp_log.txt; then
        echo -e "\n${RED}${script_name} has been error${WHITE}"
        
        
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