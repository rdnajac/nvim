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

require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})