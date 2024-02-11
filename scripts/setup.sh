#!/bin/bash

packages=("neofetch" "btop" "nodejs" "npm" "htop" "tilix" "tmux" "curl" "vim" "stow")

# Install apt packages
for package in ${packages[@]}; do
    if ! dpkg -l | grep -q $package; then
        sudo apt install -y $package
    else
        echo "$package is already installed"
    fi
done

# Link dotfiles
stow .

# Install neovim
curl https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage ~/Downloads/nvim.appimage
chmod u+x ~/Downloads/nvim.appimage
sudo mv ~/Downloads/nvim.appimage /usr/bin/nvim
rm ~/Downloads/nvim.appimage

# Install nvchad
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim --headless +PackerInstall +qall