--- init.lua
LAZY_SPEC = {
  { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
  { import = 'lazyvim.plugins.extras.ai.copilot' },
  { import = 'lazyvim.plugins.extras.coding.mini-comment' },
  { import = 'lazyvim.plugins.extras.coding.mini-surround' },
  { import = 'lazyvim.plugins.extras.editor.harpoon2' },
  { import = 'lazyvim.plugins.extras.formatting.prettier' },
  { import = 'plugins' },
}

require('config.lazy')
-- require('config.autocmds')
-- require('config.keymaps')
-- require('config.options')
-- require('user.lsp')
-- require('user.cmp')
