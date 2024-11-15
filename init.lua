-- init.lua
local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify('Error loading module: ' .. module, vim.log.levels.ERROR)
    return nil
  end
  print('Loaded module: ' .. module)
  return result
end

safe_require('options')
safe_require('keymaps')
safe_require('autocmds')
safe_require('plugins')

-- local plugins = require('plugins')
local plugins = { { 'folke/tokyonight.nvim' } }
local config = require('config.lazy')

require('lazy').setup(plugins, config)
vim.cmd('colorscheme tokyonight-night')
