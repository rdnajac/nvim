--- init.lua
-- This is the main configuration file for Neovim, written in Lua.
-- It is responsible for loading various plugin.configuration modules.

-- Core Modules
require "launch"       -- Handles the launch configuration of Neovim.
require "options"      -- Sets up Neovim options and general settings.
require "keymaps"      -- Configures key mappings.
require "autocmds"     -- Defines autocommands for automated tasks.

-- Plugin Specifications
-- The 'spec' function is used to specify plugin configurations (???).

-- User Interface Enhancements
spec "plugin.colorscheme"    -- Color scheme customization
spec "plugin.lualine"        -- Status line configuration

spec "plugin.devicons"       -- File icons

spec "plugin.alpha"          -- Customizable start screen
spec "plugin.indentline"     -- Visual indentation guides
spec "plugin.diffview"       -- Git diff visualization

-- File and Project Navigation
spec "plugin.nvimtree"       -- File explorer
spec "plugin.telescope"      -- Fuzzy finder
spec "plugin.telescope-tabs" -- Tab management with Telescope
spec "plugin.project"        -- Project management

-- Coding Completion and Syntax Tools
spec "plugin.treesitter"     -- Enhanced syntax highlighting and parsing
spec "plugin.autopairs"      -- Auto pairing of brackets and quotes
spec "plugin.comment"        -- Easy commenting of code blocks
spec "plugin.cmp"            -- Completion engine configurations

-- Git Integration
spec "plugin.gitsigns"       -- Git integration with editor signs
spec "plugin.neogit"         -- Enhanced Git experience

-- Language Server Protocol (LSP) and Development Tools
spec "plugin.lspconfig"      -- Language server configurations
spec "plugin.mason"          -- LSP servers and tools management
spec "plugin.null-ls"        -- Integration of linters and formatters
spec "plugin.schemastore"    -- JSON schema settings
spec "plugin.illuminate"     -- Highlighting of current word usage
spec "plugin.navic"          -- Navigation enhancements

-- Key Mapping and Commands
spec "plugin.whichkey"       -- Keybinding assistance

-- Terminal and Shell Integration
spec "plugin.toggleterm"     -- Terminal integration

-- Utility and Miscellaneous
spec "plugin.breadcrumbs"    -- Breadcrumb navigation
spec "plugin.netrw"          -- Built-in file explorer
spec "plugin.bufdelete"      -- Buffer deletion without closing windows

-- New and untested
spec "plugin.trouble"
spec "plugin.text-to-colorscheme"

-- Lazy Loading
require "plugin._lazy"        -- Handles lazy loading of certain plugins or configurations.

