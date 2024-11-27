--- init.lua
require('user.autocmds')
require('user.keymaps')

LAZY_SPEC = {
  { dir = '~/.vim/' },
  { import = 'plugins' },
  { 'tpope/vim-surround' },
  {
    'stevearc/oil.nvim',
    lazy = true,
    cmd = 'Oil',
    opts = {},
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}

require('user.bootstrap')
require('user.cmp')

vim.cmd('set undofile') -- persistent undo
