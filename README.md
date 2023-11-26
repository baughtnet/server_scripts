README.md - server_scripts repository
https://github.com/baughtnet/server_scripts

This is intended to to be a repo for configuration and scripts accross various deployments as a starting config.  You should be able to reproduce my results as long as you install the same starting points as I did.  All I have done is added on top of tmux plugin manager and kickstart.nvim

TMUX CONFIGURATION

In order to use tmux in the server_scripts repository, you need to clone the Tmux Plugin Manager repository to ~/.tmux/plugins/tpm.  You can run the command below or "./tmux_tpm.sh" in the tmux 

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

NEOVIM CONFIGURATION

In order to use the provided neovim config, start with an installation of at least neovim 0.8.0.
Then install kickstart.nvim with - "# on Linux and Mac
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim"
This will work for MacOS and Linux, see https://github.com/nvim-lua/kickstart.nvim for other OS

