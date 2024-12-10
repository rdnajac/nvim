vim.cmd([[
cnoreabbrev Wq wqa!
cnoreabbrev wq wqa!
source ~/.vim/plugin/autocmds/filetypes.vim
]])

LAZY_SPEC = {
  {
    'LazyVim/LazyVim',
    -- TODO this seems kinda hacky
    cond = not not vim.env.LAZY,
    import = 'lazyvim.plugins', -- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/
    opts = {
      defaults = {
        autocmds = false,
        keymaps = false,
      },
      icons = {
        -- TODO delegate to mini.icons?
        diagnostics = require('user.icons').diagnostics,
      },
    },
  },
  -- disable plugins
  { 'folke/flash.nvim', enabled = false },
  { 'echasnovski/mini.pairs', enabled = false },
  { 'akinsho/bufferline.nvim', enabled = false },
  -- { 'folke/noice.nvim', enabled = false },
  { 'lukas-reineke/indent-blankline.nvim', enabled = false },

  -- import my plugins (and configure lazy plugins)
  { import = 'plugins' },

  -- testing...
  { 'max397574/better-escape.nvim', opts = {} },
}

require('user.options')
require('config.lazy')
require('config.oil')
