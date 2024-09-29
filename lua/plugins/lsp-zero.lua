return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = false,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end
      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              on_init = function(client)
                lsp_zero.nvim_lua_settings(client, {})
              end,
            })
          end,
          clangd = function()
            require("lspconfig").clangd.setup({
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--suggest-missing-includes",
                "--offset-encoding=utf-8",
              },
              filetypes = { "c", "cpp", "objc", "objcpp" },
              on_attach = function(client, bufnr)
                lsp_attach(client, bufnr)
                if vim.bo[bufnr].filetype == "cpp" then
                  client.config.settings = client.config.settings or {}
                  client.config.settings.clangd = client.config.settings.clangd or {}
                  client.config.settings.clangd.extraArgs = { "-std=c++14" }
                  client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
              end,
            })
          end,
          pyright = function()
            require("lspconfig").pyright.setup({})
          end,
        },
      })
    end,
  },
}
