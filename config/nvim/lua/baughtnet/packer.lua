-- setup packer and telescope
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    -- theme
   'rmehri01/onenord.nvim',
   config = function()
      require("onenord").setup()
    end
  }

  use {
    'Exafunction/codeium.vim',
    config = function()
    end
    }

  use {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end
    }

  -- setup which-key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }


-- general plugins
-- treesitter
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('nvim-lua/plenary.nvim')
-- harpoon
use('ThePrimeagen/harpoon')
--  undotree
use('mbbill/undotree')
-- tpope plugins
use('tpope/vim-fugitive')
use('tpope/vim-sleuth')
-- lualina and icons
use('nvim-lualine/lualine.nvim')
use('nvim-tree/nvim-web-devicons')
-- formatting
use('numToStr/Comment.nvim')
use('lukas-reineke/indent-blankline.nvim')

end)
