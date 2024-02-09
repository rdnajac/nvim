local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers = {
        "lua_ls",
        "clangd",
        "bashls",
        "yamlls",
        "marksman",
        "ocamllsp",
    }
    require("mason").setup { ui = { border = "rounded", }, }
    require("mason-lspconfig").setup { ensure_installed = servers, }
end

return M
