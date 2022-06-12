local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-l>", "<C-W>l", opts)
map("n", "<C-s>", ":source ~/.config/nvim/init.lua<CR>", opts)
map("n", "<C-g>", ":Goyo<CR>", opts)
