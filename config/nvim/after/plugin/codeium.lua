--set highlight color for codeium suggestions
vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = "#fc3d03" })

-- enable codeium and disable tab complete
-- hoping this combined with the leader disable/enable codeium
-- will stop fights with LSP
vim.g.codeium_no_map_tab = true
vim.g.codeium_enabled = true

-- set leader shortcut to disable/enable codeium
vim.keymap.set('n', '<leader>ce', vim.cmd.CodeiumEnable)
vim.keymap.set('n', '<leader>cd', vim.cmd.CodeiumDisable)

-- set keyboard shortcuts for completion and cycle through completions
vim.keymap.set('i', '<c-Space>', function () return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<c-]>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<c-[>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
