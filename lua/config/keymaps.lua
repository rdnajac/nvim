-- keymaps.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua
---@diagnostic disable: unused-local
local map = vim.keymap.set
local del = vim.keymap.del

vim.cmd([[
" make mini-surround more like vim-surround
nmap S viwsa
vmap S sa
nmap sc sr
vmap sc sr
]])
