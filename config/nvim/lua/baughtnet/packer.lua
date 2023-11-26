-- setup packer and telescope
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end
    })


    
  use {
    'Exafunction/codeium.vim',
    config = function ()
      vim.keymap.set('i', '<C-Space>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
}

-- theme
use({'rmehri01/onenord.nvim'})

-- general plugins
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('nvim-lua/plenary.nvim')
use('ThePrimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('tpope/vim-sleuth')
use('nvim-lualine/lualine.nvim')
use('nvim-tree/nvim-web-devicons')
end)
