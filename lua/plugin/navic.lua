--- navic.lua
local M = {
    "SmiteshP/nvim-navic",
    commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
    -- as far as I know, breadcrumbs is only used by navic
    dependencies = {
        {
            "LunarVim/breadcrumbs.nvim",
            commit = "1033b354f65206793831207d5c9047fc059e35c3",
        }
    }
}

function M.config()
    local icons = require "plugin.icons"
    require("nvim-navic").setup {
        icons = icons.kind,
        highlight = true,
        lsp = {
            auto_attach = true,
        },
        click = true,
        separator = " " .. icons.ui.ChevronRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
    }
end

return M

