--- netrw.lua
local M = {
    "prichrd/netrw.nvim",
    event = "VeryLazy",
    commit = "596435bd2f5b0162b86c97ca8244e2b0862d3a4a",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            --event = "VeryLazy",
        }
    },

}

function M.config()
    require("netrw").setup{}
end

return M

