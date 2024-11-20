--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local plugins = require('plugins')
require('config.lazy').setup({ plugins })
require('config.cmp')
require('config.lsp')
