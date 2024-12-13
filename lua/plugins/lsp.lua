return {
  'neovim/nvim-lspconfig',
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  ---@class PluginLspOpts
  opts = {
    ---@type vim.diagnostic.Opts
    diagnostics = {
      -- virtual_text = { false },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '🔥',
          [vim.diagnostic.severity.WARN] = '💩',
          [vim.diagnostic.severity.HINT] = '👾',
          [vim.diagnostic.severity.INFO] = '🧠',
        },
      },
    },
  },
}
