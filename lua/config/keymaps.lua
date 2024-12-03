--- config/keymaps.lua
local map = vim.keymap.set

map('n', '<localleader>hi', "<cmd>echo 'hi =)'<cr>", { noremap = true })
