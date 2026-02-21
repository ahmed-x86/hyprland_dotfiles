#!/bin/bash

echo -e "\n🔥 [Step 5]: Forging the Terminal (Zsh & Oh-My-Posh)..."

USER_HOME="$HOME"
OMP_CONFIG_DIR="$USER_HOME/.config/ohmyposh"


echo -e "📦 Checking and installing Zsh..."
if ! command -v zsh &> /dev/null; then
    sudo pacman -S --noconfirm zsh
else
    echo "   ✔️ Zsh is already installed."
fi


echo -e "📦 Installing Oh-My-Posh..."
yay -S --noconfirm oh-my-posh-bin


echo -e "🎨 Downloading Catppuccin theme for Oh-My-Posh..."
mkdir -p "$OMP_CONFIG_DIR"
curl -sLo "$OMP_CONFIG_DIR/catppuccin.omp.json" "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/catppuccin.omp.json"


echo -e "📄 Copying .zshrc configuration..."
if [ -f ".zshrc" ]; then
    cp .zshrc "$USER_HOME/"
    echo "   ✔️ .zshrc successfully placed in $USER_HOME."
else
    echo "   ⚠️ Warning: .zshrc not found in the current directory!"
fi


echo -e "🔄 Changing default shell to Zsh..."

chsh -s "$(command -v zsh)"

echo -e "✅ [Step 5]: Terminal armory has been fully upgraded for $USER!\n"