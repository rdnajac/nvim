-- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('config') .. '/.lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print('Lazy.nvim not found. Installing...')
  -- local bootstrap_script = vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')
  -- loadstring(bootstrap_script)()
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim and configure plugins
local lazy_config = require('config.lazy')
require('lazy').setup(lazy_config)
vim.cmd('colorscheme tokyonight')
-- require('lsp')
