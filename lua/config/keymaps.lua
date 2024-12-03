--- config/keymaps.lua
local map = vim.keymap.set

map('n', '<localleader>\\', "<cmd>echo 'hi =)'<cr>", { noremap = true })
map('c', '??', 'verbose set?<Left>', { noremap = true })
map('c', '!!', '!./%', { noremap = true })
map('n', '<Tab>', ':bnext<CR>', { noremap = true })
map('n', '<S-Tab>', ':bprev<CR>', { noremap = true })
