#!/usr/bin/env bash

# Colors matching the rest of the online scripts
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "\n${BLUE}🔥 [Online Step 7]: The Ecosystem Integration (GitHub & Mobile)...${NC}"

# ==========================================
# 1. GitHub Integration
# ==========================================
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

# ==========================================
# 2. Mobile Integration (KDE Connect)
# ==========================================
echo -e "\n${BLUE}------------------------------------------------------${NC}"

while true; do
    echo -e "${CYAN}📱 Do you want to set up the Mobile Ecosystem (KDE Connect)? (y/n)${NC}"
    read -r -p "> " mobile_choice < /dev/tty || mobile_choice="n"
    mobile_choice=${mobile_choice,,}

    if [[ "$mobile_choice" == "y" || "$mobile_choice" == "yes" ]]; then
        echo -e "\n${YELLOW}Awesome! Let's connect your devices.${NC}"
        
        # Check and configure UFW if active
        if command -v ufw >/dev/null 2>&1; then
            if sudo ufw status | grep -qi "active"; then
                echo -e "${CYAN}🛡️  UFW Firewall is active. Opening ports for KDE Connect (1714-1764)...${NC}"
                sudo ufw allow 1714:1764/tcp >/dev/null
                sudo ufw allow 1714:1764/udp >/dev/null
                sudo ufw reload >/dev/null
                echo -e "   ${GREEN}✔️ Ports opened successfully!${NC}"
            fi
        fi

        PC_NAME=$(hostname)
        echo -e "\n${CYAN}📲 Grab your phone and open the KDE Connect app.${NC}"
        echo -e "${CYAN}🔍 Look for this PC name in the app: ${YELLOW}${PC_NAME}${NC}"
        
        echo -e "\n${BLUE}🔄 Refreshing KDE Connect daemon...${NC}"
        kdeconnect-cli --refresh >/dev/null 2>&1 || true
        
        echo -e "${CYAN}📡 Please tap on '${PC_NAME}' on your phone and request pairing.${NC}"
        echo -e "🔔 ${YELLOW}A notification will pop up here on your PC screen. Click 'Accept'.${NC}"
        
        echo ""
        read -r -p "Press [Enter] when you have successfully paired to continue..." dummy < /dev/tty
        echo -e "   ${GREEN}✔️ Mobile ecosystem ready!${NC}"
        break

    elif [[ "$mobile_choice" == "n" || "$mobile_choice" == "no" ]]; then
        echo -e "\n${YELLOW}⏭️  Skipping Mobile integration.${NC}"
        break

    else
        echo -e "${RED}![Error]: Invalid input. Please type 'y' for yes, or 'n' for no.${NC}\n"
    fi
done

# ==========================================
# 3. Final Wrap-up
# ==========================================
echo -e "\n${GREEN}✅ [Online Step 7]: Ecosystem integration complete!${NC}"
echo -e "🎉 CONGRATULATIONS! The setup is 100% COMPLETE! 🎉"
echo -e "${BLUE}Please REBOOT your system to apply all changes smoothly.${NC}\n"