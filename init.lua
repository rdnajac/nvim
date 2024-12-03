--- init.lua
local plug = table.insert

LAZY_SPEC = { { import = 'plugins' } }

if os.getenv('LAZY') == 'true' then
  plug(LAZY_SPEC, { 'LazyVim/LazyVim', import = 'lazyvim.plugins' })
  plug(LAZY_SPEC, { import = 'lazyvim.plugins.extras.ai.copilot' })
  plug(LAZY_SPEC, { import = 'lazyvim.plugins.extras.coding.mini-comment' })
  plug(LAZY_SPEC, { import = 'lazyvim.plugins.extras.coding.mini-surround' })
  plug(LAZY_SPEC, { import = 'lazyvim.plugins.extras.editor.mini-files' })
  -- plug(LAZY_SPEC, { import = 'lazyvim.plugins.extras.formatting.prettier' })
else
  require('user.autocmds')
  require('user.keymaps')
  require('user.options')
  print('💤💤💤')
end

require('config.lazy')
