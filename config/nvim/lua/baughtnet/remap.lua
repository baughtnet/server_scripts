-- set clipboard to unamedplus
vim.o.clipboard = "unnamedplus"

-- set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set line numbers on
vim.wo.number = true

-- remap esc to jk or kj in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- map leader shortcut for netrw
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- map leader for oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- set leader shortcut for packer sync
vim.keymap.set('n', '<leader>pp', vim.cmd.PackerSync)

-- set leader shortcut for packer clean
vim.keymap.set('n', '<leader>pc', vim.cmd.PackerClean)

-- set leader for shortcut for :source %
vim.keymap.set('n', '<leader>so', vim.cmd.so)

-- set leader shortcut to write
vim.keymap.set('n', '<leader>w', vim.cmd.w)

-- set leader shortcut to quit
vim.keymap.set('n', '<leader>q', vim.cmd.q)

-- set leader shortcut to write and quit
vim.keymap.set('n', '<leader>WQ', vim.cmd.wq)

-- set leader shortcut to write quit
-- allow moving blocks of selected text with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep text in the middle while scrolling half page or searching
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- setup quick nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set leader x to chmod +x to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- setup a tmux copy paste
-- vim.api.nvim_set_keymap('n', '<leader>tc', [[:write !tmux load-buffer -<CR><CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>tp', [[:write !tmux save-buffer -<CR>]], { noremap = true, silent = true })

