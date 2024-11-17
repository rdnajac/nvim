return {
  { 'neovim/nvim-lspconfig' },
  { 'VonHeikemen/lsp-zero.nvim', opts = {} },
  { 'williamboman/mason.nvim', opts = {} },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
        {},
      },
    },
  },
}
