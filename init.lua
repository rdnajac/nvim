vim.cmd([[
cnoreabbrev Wq wqa!
cnoreabbrev wq wqa!
source ~/.vim/plugin/autocmds/filetypes.vim
]])

LAZY_SPEC = {
  {
    'LazyVim/LazyVim',
    -- cond = not not vim.env.LAZY,
    import = 'lazyvim.plugins', -- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/
    opts = {
      defaults = {
        autocmds = false,
        keymaps = false,
      },
      icons = {
        -- TODO: delegate to mini.icons?
        diagnostics = require('user.icons').diagnostics,
      },
    },
  },
  -- disable LazyVim plugins
  { 'catppuccin/nvim', enabled = false },
  { 'folke/flash.nvim', enabled = false },
  { 'echasnovski/mini.pairs', enabled = false },
  { 'akinsho/bufferline.nvim', enabled = false },
  { 'nvim-lualine/lualine.nvim', enabled = false },
  { 'lukas-reineke/indent-blankline.nvim', enabled = false },

  -- import my plugins (and configure lazy plugins)
  { import = 'plugins' },

  { 'max397574/better-escape.nvim', opts = {} },
}

require('config.autocmds')
require('config.keymaps')
require('config.options')
require('config.lazy')
require('config.oil')
require('config.snacks')
