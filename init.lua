--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.lazy')
require('config.cmp')
require('config.lsp')
