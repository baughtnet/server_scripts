#!/bin/bash

# Bash script for installing apps on Ubuntu 24.04 fresh install

# Install nala
sudo apt install nala -y

# Update & Upgrade
sudo nala update && sudo nala upgrade -y

# Install some base apps
sudo nala install curl git nginx cerbot python3-certbot-nginx tldr nodejs npm tmux keychain -y

# Install node.js 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Install bin for github binaries
curl -fsSL https://github.com/marcosnils/bin/releases/download/v0.23.1/bin_0.23.1_linux_amd64 | bash -

# Install oh-my-bash
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# install claude-code(disabled by default)
# curl -fsSL https://claude.ai/install.sh | bash

# Configure neovim and tmux
mkdir ~/git
cd ~/git
git clone https://github.com/baughtnet/server_scripts.git -b v1
cd server_scripts
./scripts/config/config_nvim.sh
./scripts/config/config_tmux.sh

