--- init.lua
require('user.options')
require('user.autocmds')
require('user.commands')

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

require('lazy').setup({
  spec = {
    {
      'LazyVim/LazyVim',
      import = 'lazyvim.plugins',
      opts = {
        defaults = {
          autocmds = false,
          keymaps = false,
        },
      },
    },
    -- add my plugins from ~/.config/nvim/lua/plugins
    { import = 'plugins' },
  },
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  pkg = { enabled = false },
  rocks = { enabled = false },
  install = { colorscheme = { 'tokyonight' } },
  ui = {
    border = 'rounded',
    icons = require('user.icons').lazy,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
