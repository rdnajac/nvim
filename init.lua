--- init.lua
-- This is the main configuration file for Neovim.
-- It is responsible for loading various plugin.configuration modules.

-- Core Modules
require "launch"       -- Handles the launch configuration of Neovim.
require "options"      -- Sets up Neovim options and general settings.
require "keymaps"      -- Configures key mappings.
require "autocmds"     -- Defines autocommands for automated tasks.

-- Git Integration
spec "plugin.diffview"       -- Git diff visualization
spec "plugin.gitsigns"       -- Git integration with editor signs
spec "plugin.neogit"         -- Enhanced Git experience (???)

-- User Interface Distractions
spec "plugin.alpha"          -- Customizable start screen
spec "plugin.colorscheme"    -- Color scheme customization
spec "plugin.illuminate"     -- Highlighting of current word usage
spec "plugin.indentline"     -- Visual indentation guides
spec "plugin.lualine"        -- Status line configuration
spec "plugin.whichkey"       -- Keybinding assistance

-- QOL
spec "plugin.bufdelete"      -- Buffer deletion without closing windows
spec "plugin.comment"        -- Easy commenting of code blocks
spec "plugin.toggleterm"     -- Terminal integration

-- File Explorer
spec "plugin.breadcrumbs"    -- Shows current code context in the tabline with cute little glyphs
spec "plugin.netrw"          -- Adds little file/folder/symlink icons
spec "plugin.nvimtree"       -- File explorer
spec "plugin.project"        -- Project management
spec "plugin.telescope"      -- Fuzzy finder

-- LSP, Syntax, and Completion
spec "plugin.treesitter"     -- Enhanced syntax highlighting and parsing
spec "plugin.lspconfig"      -- Language server configurations
spec "plugin.mason"          -- LSP servers and tools management
spec "plugin.none-ls"        -- Integration of linters and formatters
spec "plugin.cmp"            -- Completion engine configurations
spec "plugin.copilot"

-- Utility and Miscellaneous
spec "plugin.markdown-preview" -- Render md files in browser

-- New and untested
spec "plugin.trouble"

-- spec "plugin.harpoon"
-- spec "plugin.neotest"

-- Lazy Loading
require "plugin._lazy"        -- Handles lazy loading of certain plugins or configurations.

-- Force color scheme
--require('colors').setup()
