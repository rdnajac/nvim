local lsp = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  print('Attaching: ' .. client.name)
  lsp.default_keymaps({ buffer = bufnr })
end

lsp.extend_lspconfig({
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = require('config.icons').lsp,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  print('called extend_lspconfig'),
})

require('lspconfig').lua_ls.setup({})
require('lspconfig').vimls.setup({})
