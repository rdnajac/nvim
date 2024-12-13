-- init.lua
require('config.lazy')

-- LazyVim configuration options
vim.g.autoformat = false
-- FIXME: this gets overridden by the lsp attach
-- vim.diagnostic.config({ virtual_text = false, })
