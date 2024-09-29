return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<localleader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt", "shellharden" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        python = { "black" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-bn", "-sr" },
        },
        shellharden = {
          prepend_args = { "--transform" },
        },
        black = {
          prepend_args = { "--quiet" },
        },
        prettier = {
          prepend_args = { "--stdin-filepath", "$FILENAME" },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
