-- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  err('Lazy.nvim not found. Installing...')
  local bootstrap_script = vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')
  loadstring(bootstrap_script)()
end

-- Set up lazy.nvim and configure plugins
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  spec = { import = 'plugins' },
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
  pkg = { enabled = false, },  -- see: `pkg.json`
  dev = {
    path =  '~' ,
    patterns = { '.vim', '.vim/.plugged/tpope', },
    fallback = true, -- fallback to git when local plugin doesn't exist
  },
  install = {
    missing = true,
    colorscheme = { 'tokyonight-night' },
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
        "matchit",
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
