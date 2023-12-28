--- bufdelete.lua
-- Configuration for the `famiu/bufdelete.nvim` plugin.
-- @module bufdelete
local M = {
  --- The name of the plugin repository.
  -- @string
  "famiu/bufdelete.nvim",

  --- The event at which the configuration should be applied.
  -- @string
  event = "VeryLazy",

  --- The specific commit hash of the plugin to use.
  -- @string
  commit = "07d1f8ba79dec59d42b975a4df1c732b2e4e37b4",
}

---
-- Configures the behavior of the `famiu/bufdelete.nvim` plugin.
-- @function config
function M.config()
  --- Set up key mappings for buffer deletion.
  local keymap = vim.keymap.set

  --- Options for key mappings.
  local opts = { noremap = true, silent = true }

  --- Define a key mapping for deleting the current buffer without prompt.
  -- @usage keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
  keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
end

return M

