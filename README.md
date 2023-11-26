README.md - server_scripts repository
https://github.com/baughtnet/server_scripts

This is intended to to be a repo for configuration and scripts accross various deployments as a starting config.  You should be able to reproduce my results as long as you install the same starting points as I did.  All I have done is added on top of tmux plugin manager and kickstart.nvim

TMUX CONFIGURATION

In order to use tmux in the server_scripts repository, you need to clone the Tmux Plugin Manager repository to ~/.tmux/plugins/tpm.  You can run the command below or "./tmux_tpm.sh" in the tmux 

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

NEOVIM CONFIGURATION

Written from scratch, in order to use:

  Start by cloning the repository to a directory on your computer.
    
    1.  git clone https://github.com/baughtnet/server_scripts
    
    2.  Ensure you have a bare neovim with no config, there should be nothing in
                "~/.config/nvim"
            No nvim directory is fine
            $ ls ~/.config

    3.  Copy the init.lua file adn the lua/ and plugin/ directories, but not the after/ directory f
            cp -R ~/git_storage_directory/server_scripts/config/nvim/ ~/.config/nvim
            rm -rf ~/.config/nvim/after

    4.  Clone the packer.nvim
            for most Linux/Unix Installations:
    
            git clone --depth 1 https://github.com/wbthomason/packer.nvim\
            ~/.local/share/nvim/site/pack/packer/start/packer.nvim
            ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    5.  Run neovim
            $nvim
 
    6.  Once loaded run
            :PackerSync

    7.  Quit Nvim and copy the after directory from the git repo to your local nvim config
            cp -R ~/git_storage_directory/server_scripts/config/nvim/after .
