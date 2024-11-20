-- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.lazy')
vim.cmd('colorscheme tokyonight-night')
require('config.cmp')
require('config.lsp')
