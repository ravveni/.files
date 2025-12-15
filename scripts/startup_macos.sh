#!/bin/bash

# XCode Command Line Tools
sudo xcode-select --install;

# Configs
mkdir ~/.config;
cp -r ./configs/kitty ~/.config/;
cp -r ./configs/nvim ~/.config/;
echo "copy directoy from default cmus to cmus/autosave before replacing"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

## Formulae
brew install cmus;
brew install ffmpeg;
brew install httpie;
brew install lua;
brew install neovim;
brew install node;
brew install tree;
brew install wget;

## Casks
echo "Select which casks to install:"
casks=(
    "alfred"
    "arduino-ide"
    "blender"
    "discord"
    "firefox"
    "freecad"
    "gimp"
    "inkscape"
    "kitty"
    "kiwix"
    "libreoffice"
    "lm-studio"
    "love"
    "vlc"
)

for i in "${!casks[@]}"; do
    echo "$((i+1)). ${casks[$i]}"
done

read -p "Enter the numbers of the casks you want to install (e.g. 1,2): " selected

# Normalize input by replacing spaces with commas
selected=$(echo "$selected" | tr ' ' ',')

IFS=',' read -r -a indices <<< "$selected"

for idx in "${indices[@]}"; do
    if [[ $idx =~ ^[0-9]+$ && $idx -ge 1 && $idx -le ${#casks[@]} ]]; then
        cask_name=${casks[$((idx-1))]}
        echo "Installing $cask_name..."
        brew install --cask "$cask_name"
    else
        echo "Invalid selection: $idx"
    fi
done

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
cp ./configs/.zshrc ~/;
source ~/.zshrc;

