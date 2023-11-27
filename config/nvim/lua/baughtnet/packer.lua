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
-- mason.nvim, lsp and other formatting plugins
use('williamboman/mason.nvim')
use('williamboman/mason-lspconfig.nvim')
use('numToStr/Comment.nvim')
use('lukas-reineke/indent-blankline.nvim')
end)
