#!/usr/bin/env bash
set -euo pipefail

PINK="\e[1;35m"
WHITE="\e[0m"
YELLOW="\e[1;33m"
GREEN="\e[1;32m"
RED="\e[1;31m"
CYAN="\e[1;36m"

echo -e "\n🔥 [Step 7]: The Ecosystem Integration (GitHub & Mobile)..."

# ==========================================
# 1. GitHub Integration
# ==========================================
ENV_FILE="$HOME/.config/waybar/scripts/.env"

while true; do
    echo -e "${CYAN}🐙 Do you want to integrate your GitHub account to show stats on your Waybar? (y/n)${WHITE}"
    read -r -p "> " choice
    choice=${choice,,}

    if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
        echo -e "\n${YELLOW}Awesome! Let's set up your GitHub integration.${WHITE}"
        
        read -r -p "Enter your GitHub Username: " github_user
        while [[ -z "$github_user" ]]; do
            echo -e "${RED}Username cannot be empty!${WHITE}"
            read -r -p "Enter your GitHub Username: " github_user
        done

        echo -e "${YELLOW}⚠️ Note: The PAT will be stored locally in an .env file. Treat this machine securely.${WHITE}"
        read -r -s -p "Enter your GitHub Personal Access Token (PAT): " github_token
        echo "" 
        while [[ -z "$github_token" ]]; do
            echo -e "${RED}Token cannot be empty!${WHITE}"
            read -r -s -p "Enter your GitHub Personal Access Token (PAT): " github_token
            echo ""
        done

        echo -e "⚙️  Writing credentials to $ENV_FILE..."
        mkdir -p "$(dirname "$ENV_FILE")"

        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=$github_user
GITHUB_PAT=$github_token
EOF
        
        chmod 600 "$ENV_FILE"
        echo -e "   ${GREEN}✔️ GitHub credentials saved securely (chmod 600)!${WHITE}"
        break

    elif [[ "$choice" == "n" || "$choice" == "no" ]]; then
        echo -e "\n${YELLOW}⏭️  Skipping GitHub integration.${WHITE}"
        mkdir -p "$(dirname "$ENV_FILE")"
        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=
GITHUB_PAT=
EOF
        break
    else
        echo -e "${RED}![Error]: Invalid input. Please type 'y' or 'n'.${WHITE}\n"
    fi
done

# ==========================================
# 2. Mobile Integration (KDE Connect)
# ==========================================
echo -e "\n------------------------------------------------------"

while true; do
    echo -e "${CYAN}📱 Do you want to set up the Mobile Ecosystem (KDE Connect)? (y/n)${WHITE}"
    read -r -p "> " mobile_choice
    mobile_choice=${mobile_choice,,}

    if [[ "$mobile_choice" == "y" || "$mobile_choice" == "yes" ]]; then
        echo -e "\n${YELLOW}Awesome! Let's connect your devices.${WHITE}"
        
        if command -v ufw >/dev/null 2>&1; then
            if sudo ufw status | grep -qi "active"; then
                echo -e "🛡️  UFW Firewall is active. Opening ports for KDE Connect (1714-1764)..."
                sudo ufw allow 1714:1764/tcp >/dev/null
                sudo ufw allow 1714:1764/udp >/dev/null
                sudo ufw reload >/dev/null
                echo -e "   ${GREEN}✔️ Ports opened successfully!${WHITE}"
            fi
        fi

        PC_NAME=$(hostname)
        echo -e "\n${CYAN}📲 Grab your phone and open the KDE Connect app.${WHITE}"
        echo -e "${CYAN}🔍 Look for this PC name in the app: ${PINK}${PC_NAME}${WHITE}"
        
        echo -e "\n${YELLOW}🔄 Refreshing KDE Connect daemon...${WHITE}"
        kdeconnect-cli --refresh >/dev/null 2>&1 || true
        
        echo -e "${CYAN}📡 Please tap on '${PC_NAME}' on your phone and request pairing.${WHITE}"
        echo -e "🔔 ${YELLOW}A notification will pop up here on your PC screen. Click 'Accept'.${WHITE}"
        
        echo ""
        read -r -p "Press [Enter] when you have successfully paired to continue..."
        echo -e "   ${GREEN}✔️ Mobile ecosystem ready!${WHITE}"
        break

    elif [[ "$mobile_choice" == "n" || "$mobile_choice" == "no" ]]; then
        echo -e "\n${YELLOW}⏭️  Skipping Mobile integration.${WHITE}"
        break
    else
        echo -e "${RED}![Error]: Invalid input. Please type 'y' or 'n'.${WHITE}\n"
    fi
done

# ==========================================
# 3. Final Wrap-up
# ==========================================
echo -e "\n✅ [Step 7]: Ecosystem integration complete!"
echo -e "🎉 CONGRATULATIONS! The setup is 100% COMPLETE! 🎉\n"
echo -e "${PINK}Please REBOOT your system to apply all changes smoothly.${WHITE}\n"