--- config/keymaps
local map = vim.keymap.set

map('n', '<localleader>hi', "<cmd>echo 'hi =)'<cr>", { noremap = true })

-- add vim keymaps
-- vim.cmd[[ source ~/.vim/plugin/config/keymaps.vim ]]
