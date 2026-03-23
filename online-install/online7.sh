#!/usr/bin/env bash

# Colors matching the rest of the online scripts
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "\n${BLUE}🔥 [Online Step 7]: The GitHub Ecosystem Integration (Waybar Radar)...${NC}"

ENV_FILE="$HOME/.config/waybar/scripts/.env"

while true; do
    echo -e "${CYAN}🐙 Do you want to integrate your GitHub account to show stats on your Waybar? (y/n)${NC}"
    
    # Read directly from the terminal to avoid pipe issues in the main script
    read -r -p "> " choice < /dev/tty || choice="n"
    choice=${choice,,}

    if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
        echo -e "\n${YELLOW}Awesome! Let's set up your GitHub integration.${NC}"
        
        # Input Username
        while true; do
            read -r -p "Enter your GitHub Username: " github_user < /dev/tty
            if [[ -n "$github_user" ]]; then break; fi
            echo -e "${RED}Username cannot be empty!${NC}"
        done

        # Input Token (hidden)
        while true; do
            read -r -s -p "Enter your GitHub Personal Access Token (PAT): " github_token < /dev/tty
            echo "" 
            if [[ -n "$github_token" ]]; then break; fi
            echo -e "${RED}Token cannot be empty!${NC}"
        done

        echo -e "${CYAN}⚙️  Writing credentials to $ENV_FILE...${NC}"
        mkdir -p "$(dirname "$ENV_FILE")"
        
        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=$github_user
GITHUB_PAT=$github_token
EOF
        chmod 600 "$ENV_FILE"
        echo -e "   ${GREEN}✔️ GitHub credentials saved securely!${NC}"
        break

    elif [[ "$choice" == "n" || "$choice" == "no" ]]; then
        echo -e "\n${YELLOW}⏭️  Skipping GitHub integration. You can set it up later.${NC}"
        mkdir -p "$(dirname "$ENV_FILE")"
        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=
GITHUB_PAT=
EOF
        break

    else
        echo -e "${RED}![Error]: Invalid input. Please type 'y' for yes, or 'n' for no.${NC}\n"
    fi
done

echo -e "\n${GREEN}✅ [Online Step 7]: Ecosystem integration complete!${NC}"
echo -e "🎉 CONGRATULATIONS! The setup is 100% COMPLETE! 🎉"
echo -e "${BLUE}Please REBOOT your system to apply all changes smoothly.${NC}\n"