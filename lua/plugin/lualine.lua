local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine", },
}

function M.config()
    local icons = require "plugin.icons"
    local diff = {
        "diff",
        colored = true,
        symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            removed = icons.git.LineRemoved
        },
    }

    local displsp = function()
        local msg = 'N/A'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end

    require("lualine").setup {
        options = {
            component_separators = { left = "", right = "" },
            --component_separators = { left = '', right = '' },
            --section_separators = { left = "", right = "" },
            section_separators = { left = '', right = '' },
            --section_separators = { left = "", right = "" },
            ignore_focus = { "NvimTree" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { {"branch", icon =""} , diff },
            lualine_c = { "diagnostics, copilot" },
            lualine_x = { "filetype", "fileformat", "o:encoding" ,  },
            lualine_z = { "location", "progress" },
            lualine_y = { {displsp, icon = " LSP:"}, },
        },
        extensions = { "quickfix", "man", "fugitive" },
    }
end

return M

