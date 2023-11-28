#!/bin/bash
# BASH script for installing tmux config from github repository

# warn the user we will wipe their current config, ask if they want to continue
# program continues based on user input
read -p "WARNING: This will remove your current tmux config. Continue? [y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# check if tmux config is present
# if it is, remove it
if [ -d ~/.tmux ]; then
    echo "Removing old tmux config..."
    rm -rf ~/.tmux
fi

# clone tmux plugin manager repo
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# clone the github repo for config
mkdir -p ~/.baughtnet
cd ~/.baughtnet
git clone https://github.com/baughtnet/server_scripts.git
cp ~/.baughtnet/server_scripts/config/tmux/.tmux.conf ~/.tmux.conf

echo "Finalizing installation..."
rm -rf ~/.baughtnet

echo ""
echo "________________________________________________________________"
echo "Please follow the steps below to finalize your tmux config"
echo "if you are currently running a all of this in a tmux session:"
echo "      run tmux source ~/.tmux.conf"
echo ""
echo "either way:"
echo "      1. open a tmux session"
echo "      2. press prefix + I"
echo ""
echo "      ** NOTE: it is a CAPITAL I **"
echo "_______________________________________________________________"
