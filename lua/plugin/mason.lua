local M = {
    "williamboman/mason-lspconfig.nvim",
    commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
    dependencies = {
        "williamboman/mason.nvim",
        "nvim-lua/plenary.nvim",
    },
}

M.servers = {
    "lua_ls",
    "clangd",
    "bashls",
    "yamlls",
    "marksman",
}

function M.config()
    require("mason").setup {
        ui = { order = "rounded",
        },
    }
    require("mason-lspconfig").setup {
        ensure_installed = M.servers,
    }
end

return M
