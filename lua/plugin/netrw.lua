local M = {
    "prichrd/netrw.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
        }
    },

}

function M.config()
    require("netrw").setup{}
end

return M

