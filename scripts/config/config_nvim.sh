#!/bin/bash
# BASH script for installing neovim config from github repository

# check if nvim config is present
# wipe ~/.config/nvim if it exists
if [ -d ~/.config/nvim ]; then
    echo "Removing old nvim config..."
    rm -rf ~/.config/nvim
fi

# wipe ~/.local/share/nvim directory if present
if [ -d ~/.local/share/nvim ]; then
    echo "Removing more old nvim config..."
    rm -rf ~/.local/share/nvim
fi

# create nvim config directory
mkdir -p ~/.config/nvim

# check if packer is installed, if not install.  then move onto config
if [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    echo "Packer is already installed, continuing to configure neovim..."

else
    echo "Installing Packer..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# clone github repo with neovim config
echo "Cloning github repo..."
mkdir -p ~/.baughtnet_nvim
cd ~/.baughtnet_nvim
git clone -b v1 https://github.com/baughtnet/server_scripts.git

echo "Configuring neovim..."
# move to neovim config directory and copy neovim config
cd server_scripts/config/nvim
cp -r init.lua lua/ ~/.config/nvim

echo "Installing plugins..."
# run neovim to and :PackerSync to install plugins
# should exit on completion
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Copying plugin config files..."
# copy plugin config files
cp -r after/ ~/.config/nvim

# remove installation directory
echo "Finalizing installation..."
rm -rf ~/.baughtnet_nvim

echo "neovim has been successfully configured, enjoy!"
