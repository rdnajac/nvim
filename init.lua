--- init.lua
LAZY_SPEC = {}

if os.getenv('LAZY') == 'true' then
  LAZY_SPEC = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    { import = 'lazyvim.plugins.extras.ai.copilot' },
    { import = 'lazyvim.plugins.extras.coding.mini-comment' },
    { import = 'lazyvim.plugins.extras.coding.mini-surround' },
    { import = 'lazyvim.plugins.extras.editor.mini-files' },
    { import = 'lazyvim.plugins.extras.editor.mini-move' },
    -- { import = 'lazyvim.plugins.extras.formatting.prettier' })
    { import = 'lazyvim.plugins.extras.lang.clangd' },
    { import = 'lazyvim.plugins.extras.lang.cmake' },
    { import = 'lazyvim.plugins.extras.lang.docker' },
    { import = 'lazyvim.plugins.extras.lang.git' },
    { import = 'lazyvim.plugins.extras.lang.markdown' },
    { import = 'lazyvim.plugins.extras.lang.ocaml' },
    { import = 'lazyvim.plugins.extras.lang.python' },
    { import = 'lazyvim.plugins.extras.lang.r' },
    { import = 'lazyvim.plugins.extras.lang.toml' },
    { import = 'lazyvim.plugins.extras.lang.yaml' },
    { import = 'lazyvim.plugins.extras.ui.edgy' },
    { import = 'lazyvim.plugins.extras.util.dot' },
    { import = 'lazyvim.plugins.extras.util.gitui' },
    { import = 'plugins' },
  }
else
  LAZY_SPEC = {
    { import = 'plugins' },
  }
  require('user.autocmds')
  require('user.keymaps')
  require('user.options')
  print('💤💤💤')
end

require('config.lazy')
