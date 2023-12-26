--- Lazy Plugin Loader Configuration
-- This script is responsible for setting up the 'lazy.nvim' plugin loader.

-- Define the path to the lazy.nvim plugin directory.
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed.
if not vim.loop.fs_stat(lazypath) then
  -- If not installed, clone the lazy.nvim repository from GitHub.
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",  -- Optimizes the cloning process.
    "https://github.com/folke/lazy.nvim.git",  -- Repository URL.
    "--branch=stable",     -- Clone the stable branch.
    lazypath,              -- Destination directory for the clone.
  }
end

-- Prepend the lazy.nvim path to the runtime path.
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim with custom configurations.
require("lazy").setup {
  spec = LAZY_PLUGIN_SPEC,    -- Plugin specification settings.
  install = {
    --colorscheme = { "primer_dark", "habamax" },  -- List of colorschemes to install.
  },
  ui = {
    border = "rounded",  -- UI border style setting.
  },
  change_detection = {
    enabled = true,  -- Enable change detection for plugins.
    notify = false,  -- Disable notifications for changes.
  },
}

