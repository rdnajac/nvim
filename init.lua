-- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print('Lazy.nvim not found. Installing...')
  local bootstrap_script = vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')
  loadstring(bootstrap_script)()
end

vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim and configure plugins
require('lazy').setup({
  spec = {
    { 'folke/tokyonight.nvim' },
    { 'VonHeikemen/lsp-zero.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp'},
    { 'hrsh7th/cmp-nvim-lsp'},
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json', -- lockfile generated after running update.
  pkg = { enabled = false, },  -- see: `pkg.json`
  install = {
    missing = true,
    -- colorscheme = { 'tokyonight-night' },
  },
  ui = {
    wrap = false,
    border = 'rounded',
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤',
    },
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = true, -- get a notification when changes are found
  },
  performance = {
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
vim.cmd('colorscheme tokyonight')
require('lsp')
