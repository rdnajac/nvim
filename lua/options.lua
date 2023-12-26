--- options.lua
-- This file configures various options in Neovim.
-- Options are organized into categories based on their functionality.

local options = {
  -- Editor Behavior
  expandtab = true,                        -- Convert tabs to spaces.
  shiftwidth = 2,                          -- Spaces inserted for each indentation.
  tabstop = 2,                             -- Spaces for a tab.
  smartindent = true,                      -- Make indenting smarter.
  autoindent = true,                       -- Good auto indent.
  smartcase = true,                        -- Smart case.
  ignorecase = true,                       -- Ignore case in search patterns.
  undofile = true,                         -- Enable persistent undo.
  updatetime = 100,                        -- Faster completion (4000ms default).
  timeoutlen = 300,                        -- Time to wait for a mapped sequence to complete (in milliseconds).
  scrolloff = 8,                           -- Minimum screen lines above/below the cursor.
  sidescrolloff = 8,                       -- Minimum screen columns to the left/right of the cursor.
  number = true,                           -- Show line numbers.
  relativenumber = false,                  -- Show relative line numbers.
  cursorline = true,                       -- Highlight the current line.
  wrap = false,                            -- Display lines as one long line.
  linebreak = true,                        -- Prevents words from being broken when wrapping.

  -- Interface Configuration
  mouse = "a",                             -- Allow the mouse to be used in Neovim.
  termguicolors = true,                    -- Set terminal GUI colors.
  signcolumn = "yes",                      -- Always show the sign column.
  numberwidth = 4,                         -- Width of the number column.
  showmode = false,                        -- Hide the default mode text (e.g. -- INSERT --).
  showtabline = 2,                         -- Always show the tabline.
  guifont = "monospace:h17",               -- Font used in graphical Neovim applications.

  -- Backup and Swap
  backup = false,                          -- Disable backup file creation.
  writebackup = false,                     -- Disable write backup.
  swapfile = false,                        -- Disable swapfile creation.

  -- Command Line
  cmdheight = 2,                           -- More space in the command-line for displaying messages.
  ruler = false,                           -- Disable the ruler.
  showcmd = false,                         -- Hide command in the bottom bar.
  laststatus = 3,                          -- Global status line.
  pumheight = 10,                          -- Pop up menu height.
  pumblend = 10,                           -- Pop up menu transparency.

  -- Other Options
  fileencoding = "utf-8",                  -- Encoding written to a file.
  clipboard = "unnamedplus",               -- Allows Neovim to access the system clipboard.
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion.
  conceallevel = 0,                        -- Visibility of concealed text (e.g., in Markdown files).
  hlsearch = true,                         -- Highlight all matches on previous search pattern.
  shortmess = "c",                         -- Flags to shorten Vim messages.
}

-- Apply the options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Additional Configurations
vim.opt.fillchars = vim.opt.fillchars + "eob: "   -- Set end-of-buffer fill characters.
vim.opt.fillchars:append { stl = " " }            -- Space for the status line.
vim.opt.formatoptions:remove({ "c", "r", "o" })   -- Modify format options.
vim.opt.iskeyword:append "-"                      -- Include hyphens in word definitions.
vim.cmd "set whichwrap+=<,>,[,],h,l"              -- Allow certain keys to wrap lines.
vim.cmd [[set iskeyword+=-]]                      -- Treat hyphens as part of a word.

-- Netrw Configuration
vim.g.netrw_banner = 0                            -- Disable the Netrw banner.
vim.g.netrw_mouse = 2                             -- Set Netrw mouse mode.

-- Remove Vim runtime path to separate Vim plugins from Neovim
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

