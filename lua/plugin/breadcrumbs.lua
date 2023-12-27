--- breadcrumbs.lua
-- Configuration for the `LunarVim/breadcrumbs.nvim` plugin.
-- @module breadcrumbs
local M = {
  --- The name of the plugin repository.
  -- @string
  "LunarVim/breadcrumbs.nvim",

  --- The specific commit hash of the plugin to use.
  -- @string
  commit = "1033b354f65206793831207d5c9047fc059e35c3",
}

---
-- Configures the behavior of the `LunarVim/breadcrumbs.nvim` plugin.
-- @function config
function M.config()
  --- Set up the `breadcrumbs` plugin.
  require("breadcrumbs").setup()
end

return M

