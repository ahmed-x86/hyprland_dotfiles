#!/usr/bin/env bash

# --- Color Palette ---
PINK="\e[1;35m"
WHITE="\e[0m"
YELLOW="\e[1;33m"
GREEN="\e[1;32m"
RED="\e[1;31m"
CYAN="\e[1;36m"

echo -e "\n🔥 [Step 7]: The GitHub Ecosystem Integration (Waybar Radar)..."

ENV_FILE="$HOME/.config/waybar/scripts/.env"

while true; do
    echo -e "${CYAN}🐙 Do you want to integrate your GitHub account to show stats on your Waybar? (y/n)${WHITE}"
    read -r -p "> " choice

    # Convert input to lowercase to handle 'Y', 'y', 'N', 'n'
    choice=${choice,,}

    if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
        echo -e "\n${YELLOW}Awesome! Let's set up your GitHub integration.${WHITE}"
        
        # Get Username
        read -r -p "Enter your GitHub Username: " github_user
        while [[ -z "$github_user" ]]; do
            echo -e "${RED}Username cannot be empty!${WHITE}"
            read -r -p "Enter your GitHub Username: " github_user
        done

        # Get Personal Access Token (PAT)
        read -r -s -p "Enter your GitHub Personal Access Token (PAT): " github_token
        echo "" # To add a newline after the hidden password input
        while [[ -z "$github_token" ]]; do
            echo -e "${RED}Token cannot be empty!${WHITE}"
            read -r -s -p "Enter your GitHub Personal Access Token (PAT): " github_token
            echo ""
        done

        # Create or Overwrite the .env file with the new data
        echo -e "⚙️  Writing credentials to $ENV_FILE..."
        
        # Make sure the directory exists just in case
        mkdir -p "$(dirname "$ENV_FILE")"

        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=$github_user
GITHUB_PAT=$github_token
EOF

        # Secure the file so only the user can read it (since it contains a token)
        chmod 600 "$ENV_FILE"

        echo -e "   ✔️ GitHub credentials saved securely!"
        break

    elif [[ "$choice" == "n" || "$choice" == "no" ]]; then
        echo -e "\n${YELLOW}⏭️  Skipping GitHub integration. You can always set it up later manually.${WHITE}"
        
        # Create an empty .env file just so the python script doesn't crash looking for it
        mkdir -p "$(dirname "$ENV_FILE")"
        cat > "$ENV_FILE" <<EOF
GITHUB_USERNAME=
GITHUB_PAT=
EOF
        break

    else
        # If the user types anything else, the loop continues
        echo -e "${RED}![Error]: Invalid input. Please type 'y' for yes, or 'n' for no.${WHITE}\n"
    fi
done

echo -e "\n✅ [Step 7]: Ecosystem integration complete!"
echo -e "🎉 CONGRATULATIONS! The setup is 100% COMPLETE! 🎉\n"
echo -e "${PINK}Please REBOOT your system to apply all changes smoothly.${WHITE}\n"