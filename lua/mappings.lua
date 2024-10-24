require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
