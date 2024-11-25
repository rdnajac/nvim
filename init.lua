--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('user.lazy')
require('user.cmp')

-- persistent undo
vim.cmd('set undofile')
