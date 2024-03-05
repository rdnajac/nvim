local M = {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
    --vim.cmd.colorscheme "material-deep-ocean"
    vim.cmd.colorscheme "oxocarbon"
    vim.api.nvim_set_hl(0, 'Normal', { fg = "#39ff14", bg = "none" })
    -- make the gutter none 
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = "none" })
    -- make the numbers background none
    vim.api.nvim_set_hl(0, 'LineNr', { bg = "none" })
    --vim.cmd.colorscheme "tokyonight-night"
end

-- Add additional colorschemes here
local extra = {
    "catppuccin/nvim",
    "rose-pine/neovim",
    "rebelot/kanagawa.nvim",
    "EdenEast/nightfox.nvim",
    "marko-cerovac/material.nvim",
    "nyoom-engineering/oxocarbon.nvim",
}

local function append_colorschemes()
    local schemes = {}
    for _, scheme in ipairs(extra) do
        table.insert(schemes, {scheme, {}})
    end
    return schemes
end

return { M, unpack(append_colorschemes()) }
