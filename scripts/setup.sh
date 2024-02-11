#!/bin/bash

packages=("neofetch" "cmatrix" "btop" "nodejs" "npm" "htop" "tilix" "tmux" "curl" "vim" "stow" "libfuse2" "wget")

# Install APT packages
for package in ${packages[@]}; do
    if ! which $package; then
        sudo apt install -y $package
    else
        echo "$package is already installed"
    fi
done

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage -P ~/Downloads
chmod u+x ~/Downloads/nvim.appimage
sudo mv ~/Downloads/nvim.appimage /usr/bin/nvim
rm ~/Downloads/nvim.appimage

# Install nvchad
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Link dotfiles
stow .