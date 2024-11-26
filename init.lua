--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('user.lazy')
require('user.cmp')
require('user.autocmds')
require('user.keymaps')

-- persistent undo
vim.cmd('set undofile')
