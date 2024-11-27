--- init.lua
require('user.autocmds')
require('user.keymaps')
require('user.plugins')
require('user.bootstrap') -- loads plugins
require('user.lsp')
require('user.cmp')
vim.cmd('set undofile') -- persistent undo
