local M = {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
    --vim.cmd.colorscheme "tokyonight-night"
    vim.cmd.colorscheme "catppuccin-mocha"
    --vim.cmd.colorscheme "rose-pine-main"
    --vim.cmd.colorscheme "kanagawa-wave"
    --vim.cmd.colorscheme "nightfox"
    --vim.cmd.colorscheme "material-deep-ocean"
end

-- add additional colorschemes here
return { M,
    { "catppuccin/nvim", {}},
    { "catppuccin/nvim", {}},
    { "rose-pine/neovim", {}},
    { "rebelot/kanagawa.nvim", {}},
    { "EdenEast/nightfox.nvim", {}},
    { "marko-cerovac/material.nvim", {}},
 }
