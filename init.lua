--- init.lua
LAZY_SPEC = {
  { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
  { import = 'plugins' },
}

require('config.lazy')
-- require('config.autocmds')
-- require('config.keymaps')
-- require('config.options')
-- require('user.lsp')
-- require('user.cmp')
