return {
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim', opts = {} },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = { 'lua_ls' },
          handlers = {
            -- applies to every language server without a "custom handler"
            function(server_name)
              -- TODO: add print
              require('lspconfig')[server_name].setup({})
            end,
          },
        },
      },
    },

    config = function()
      local lsp_zero = require('lsp-zero')
      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      -- TODO: add print
      lsp_defaults.capabilities =
        vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- enable features that only work if there is an active language server
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          -- see :help lsp-zero-keybindings
          lsp_zero.default_keymaps({ buffer = event.buf })
        end,
      })
    end,
  },
}
