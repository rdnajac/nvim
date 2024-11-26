--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

LAZY_SPEC = {
  { dir = '~/.vim/plugin/config' },
  { import = 'plugins' },
}

require('user.lazy')
require('user.cmp')
require('user.autocmds')
require('user.keymaps')

vim.cmd('set undofile') -- persistent undo
