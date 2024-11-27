--- user/keymaps.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

map('n', '<localleader>hi', "<cmd>echo 'hi =)'<cr>", { noremap = true })
