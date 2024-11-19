local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  print('Attaching: ' .. client.name)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = require('config.icons'),
})

require('lspconfig').lua_ls.setup({
  on_init = function(client)
    lsp_zero.nvim_lua_settings(client, {})
  end,
})
