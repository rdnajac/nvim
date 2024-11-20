--- lua/config/lazy.lua
local M = {}

-- Define the function to accept a spec table
M.setup = function(spec)
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
  else
    vim.opt.rtp:prepend(lazypath)
  end

  -- Now use the spec passed in from init.lua
  require('lazy').setup({
    spec = spec,
    local_spec = false,
    lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
    pkg = { enabled = false }, -- see: `pkg.json`
    rocks = { enabled = false },
    install = { missing = true, colorscheme = { 'tokyonight' } },
    ui = {
      wrap = false,
      border = 'rounded',
      icons = require('config.icons').lazy,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          'gzip',
          -- 'matchit',
          -- 'matchparen',
          -- 'netrwPlugin',
          'tarPlugin',
          'tohtml',
          'tutor',
          'zipPlugin',
        },
      },
    },
  })
  vim.cmd([[ colorscheme tokyonight-night ]])
end

-- Return the setup function so it can be called from init.lua
return M
