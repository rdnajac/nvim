--- autopairs.lua
-- Configuration for the `windwp/nvim-autopairs` plugin.
-- @module autopairs
local M = {
  --- The name of the plugin repository.
  -- @string
  "windwp/nvim-autopairs",

  --- The event at which the configuration should be applied.
  -- @string
  event = "InsertEnter",

  --- The specific commit hash of the plugin to use.
  -- @string
  commit = "f6c71641f6f183427a651c0ce4ba3fb89404fa9e",
}

---
-- Configures the behavior of the `nvim-autopairs` plugin.
-- @function config
M.config = function()
  require("nvim-autopairs").setup {
    --- Mapping characters for autopairs.
    -- @table map_char
    map_char = {
      all = "(",
      tex = "{",
      comment = "*/",  -- Add mapping for /* */ comments
    },

    --- Enable checking if a bracket is on the same line.
    -- @bool
    enable_check_bracket_line = false,

    --- Enable checking for TypeScript.
    -- @bool
    check_ts = true,

    --- TypeScript configuration.
    -- @table ts_config
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },

    --- Disable autopairs for specific filetypes.
    -- @table disable_filetype
    disable_filetype = { "TelescopePrompt", "spectre_panel" },

    --- Characters to be ignored as next characters for autopairs.
    -- @string
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),

    --- Enable moving the cursor to the right after autopairing.
    -- @bool
    enable_moveright = true,

    --- Disable autopairs within macros.
    -- @bool
    disable_in_macro = false,

    --- Enable autopairs after a quote character.
    -- @bool
    enable_afterquote = true,

    --- Enable mapping the Backspace key.
    -- @bool
    map_bs = true,

    --- Disable mapping Ctrl-w.
    -- @bool
    map_c_w = false,

    --- Disable autopairs in visual block mode.
    -- @bool
    disable_in_visualblock = false,

    --- Configuration for fast wrapping.
    -- @table fast_wrap
    fast_wrap = {
      --- Mapping key for fast wrapping.
      -- @string
      map = "<M-e>",

      --- Characters to trigger fast wrapping.
      -- @table chars
      chars = { "{", "[", "(", '"', "'", "*/" },  -- Add "*/" for comment wrapping

      --- Pattern for fast wrapping.
      -- @string
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),

      --- Offset from pattern match.
      -- @number
      offset = 0,

      --- End key for fast wrapping.
      -- @string
      end_key = "$",

      --- Keys used for fast wrapping.
      -- @string
      keys = "qwertyuiopzxcvbnmasdfghjkl",

      --- Check for commas when fast wrapping.
      -- @bool
      check_comma = true,

      --- Highlight group for search.
      -- @string
      highlight = "Search",

      --- Highlight group for comment.
      -- @string
      highlight_grey = "Comment",
    },
  }
end

return M

