-- snacks.profiler {{{
if vim.env.PROF then
  local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
  vim.opt.rtp:append(snacks)
  require('snacks.profiler').startup({
    startup = {
      -- event = 'VimEnter',
      -- event = "UIEnter",
      event = 'VeryLazy',
    },
  })
end
-- }}}

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

local icons = require('user.icons')

require('lazy').setup({
  spec = {
    {
      'LazyVim/LazyVim',
      -- enabled = false,
      import = 'lazyvim.plugins',
      opts = {
        defaults = {
          autocmds = false,
          keymaps = false,
        },
        icons = {
          -- TODO delegate to mini.icons?
          diagnostics = icons.diagnostics,
        },
      },
    },
    { import = 'plugins' },
    -- { 'tpope/vim-fugitive' },
    -- { 'tpope/vim-repeat' },
  },
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  pkg = { enabled = false },
  rocks = { enabled = false },
  install = { colorscheme = { 'tokyonight' } },
  ui = {
    border = 'rounded',
    icons = icons.lazy,
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
