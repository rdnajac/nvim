--- init.lua
require('user.autocmds')
require('user.keymaps')

LAZY_SPEC = {
  { dir = '~/.vim/' },
  { import = 'plugins' },
}

require('user.bootstrap')
require('user.cmp')

vim.cmd('set undofile') -- persistent undo
