#!/bin/bash

# XCode Command Line Tools
sudo xcode-select --install;

# Configs
mkdir ~/.config;
cp -r ./config/kitty ~/.config/;
cp -r ./config/nvim ~/.config/;
echo "Copy directory from default cmus to cmus/autosave before replacing"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

## Formulae
brew install cmus;
brew install fd;
brew install ffmpeg;
brew install httpie;
brew install lua;
brew install luarocks;
brew install neovim;
brew install node;
brew install ollama;
brew install ripgrep;
brew install tree;
brew install tree-sitter-cli;
brew install utftex;
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
    "love"
    "ultimaker-cura"
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
cp ./config/.zshrc ~/;
source ~/.zshrc;
