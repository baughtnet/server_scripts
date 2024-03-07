#!/bin/bash

# Update OS
sudo apt update && sudo apt upgrade -y
echo "System Update and Upgrade complete"
sleep 2
clear

#install nala
echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
echo "nala repo added!"
sleep 2
clear

#sudo apt install nala -y
echo "installed nala"
sleep 2

sudo nala update

# install tmux, stow, btop, tldr, etc
sudo nala install tmux stow tldr cargo fontconfig -y

#install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# setup stow
mv ~/.bashrc ~/.bashrc.bak

cd ~/
git clone https://github.com/baughtnet/dotme.git
mv ~/dotme ~/.dotfiles
sleep 2
cd ~/.dotfiles
sleep 2
stow -v bash

source ~/.bashrc

#install neovim with bob
cargo install --git https://github.com/MordechaiHadad/bob.git

echo 'export PATH="$PATH:/home/dbaugh/.cargo/bin"' >> ~/.bashrc
source ~/.bashrc

bob install stable
sleep 1
bob use stable

echo 'export PATH="$PATH:/home/dbaugh/.local/share/bob/nvim-bin"' >> ~/.bashrc
source ~/.bashrc

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
sudo fc-cache -fv

# configure neovim
cd ~/
git clone https://github.com/baughtnet/server_scripts.git
cd server_scripts
git checkout v1
cd scripts/config
./config_nvim.sh

# configure tmux
cd ~/baughtnet/server_scripts/scripts/config
cd scripts/config
./config_tmux.sh
