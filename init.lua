-- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()
else
  vim.opt.rtp:prepend(lazypath)
end

-- launch
LAZY_PLUGIN_SPEC = {}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, item)
end

-- Set up lazy.nvim and configure plugins
spec('folke/tokyonight.nvim')

require('lazy').setup(LAZY_PLUGIN_SPEC, require('config.lazy'))

vim.cmd('colorscheme tokyonight')
