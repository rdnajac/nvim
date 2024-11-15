-- init.lua
local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify('Error loading module: ' .. module, vim.log.levels.ERROR)
    return nil
  end
  return result
end

safe_require('options')
safe_require('keymaps')
safe_require('autocmds')
