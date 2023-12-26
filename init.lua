--- init.lua
-- This is the main configuration file for Neovim, written in Lua.
-- It is responsible for loading various user configuration modules.

-- Core Modules
require "user.launch"       -- Handles the launch configuration of Neovim.
require "user.options"      -- Sets up Neovim options and general settings.
require "user.keymaps"      -- Configures key mappings.
require "user.autocmds"     -- Defines autocommands for automated tasks.

-- Plugin Specifications
-- The 'spec' function is used to specify plugin configurations (???).

-- User Interface Enhancements
spec "user.colorscheme"    -- Color scheme customization
spec "user.alpha"          -- Customizable start screen
spec "user.lualine"        -- Status line configuration
spec "user.devicons"       -- File icons
spec "user.indentline"     -- Visual indentation guides
spec "user.diffview"       -- Git diff visualization

-- File and Project Navigation
spec "user.nvimtree"       -- File explorer
spec "user.telescope"      -- Fuzzy finder
spec "user.telescope-tabs" -- Tab management with Telescope
spec "user.project"        -- Project management

-- Coding and Syntax Tools
spec "user.treesitter"     -- Enhanced syntax highlighting and parsing
spec "user.autopairs"      -- Auto pairing of brackets and quotes
spec "user.comment"        -- Easy commenting of code blocks

-- Git Integration
spec "user.gitsigns"       -- Git integration with editor signs
spec "user.neogit"         -- Enhanced Git experience

-- Language Server Protocol (LSP) and Development Tools
spec "user.lspconfig"      -- Language server configurations
spec "user.mason"          -- LSP servers and tools management
spec "user.null-ls"        -- Integration of linters and formatters
spec "user.schemastore"    -- JSON schema settings
spec "user.illuminate"     -- Highlighting of current word usage
spec "user.navic"          -- Navigation enhancements

-- Key Mapping and Commands
spec "user.keymaps"        -- Custom key mappings
spec "user.whichkey"       -- Keybinding assistance

-- Completion and Editing Tools
spec "user.cmp"            -- Completion engine configurations
spec "user.autocmds"       -- Autocommands for automated tasks

-- Terminal and Shell Integration
spec "user.toggleterm"     -- Terminal integration

-- Utility and Miscellaneous
spec "user.breadcrumbs"    -- Breadcrumb navigation
spec "user.netrw"          -- Built-in file explorer
spec "user.bufdelete"      -- Buffer deletion without closing windowsi

-- Lazy Loading
require "user.lazy"        -- Handles lazy loading of certain plugins or configurations.

