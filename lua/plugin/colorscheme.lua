local M = {
    {
        "folke/tokyonight.nvim",
        lazy = false,  -- Main color scheme, loaded at startup
        priority = 1000,
    },
    { "catppuccin/nvim", lazy = true },
    { "rose-pine/neovim", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    { "EdenEast/nightfox.nvim", lazy = true },
    { "marko-cerovac/material.nvim", lazy = true },
    -- Add more color schemes in a similar fashion if needed
}

function M.config()
    vim.cmd.colorscheme "tokyonight-night"  -- Activate the main color scheme
end

return M

