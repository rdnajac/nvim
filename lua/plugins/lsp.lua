return {
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'VonHeikemen/lsp-zero.nvim',
        config = function()
          local lsp = require('lsp-zero')

          local lsp_attach = function(client, bufnr)
            vim.print('Attaching: ' .. client.name)
            lsp.default_keymaps({ buffer = bufnr })
          end

          lsp.extend_lspconfig({
            lsp_attach = lsp_attach,
            float_border = 'rounded',
            sign_text = require('user.icons').lsp,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          })
        end,
      },
      { 'williamboman/mason.nvim', cmd = 'Mason', lazy = false, opts = {} },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          },
        },
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'bash-language-server',
            'lua-language-server',
            'vim-language-server',
          },
        },
      },
    },
  },
  -- config for lua ls
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
