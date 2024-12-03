--- lua/config/lazy.lua
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

LAZY_SPEC = {
  { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
  { import = 'lazyvim.plugins.extras.ai.copilot' },
  { import = 'lazyvim.plugins.extras.coding.mini-comment' },
  { import = 'lazyvim.plugins.extras.coding.mini-surround' },
  { import = 'lazyvim.plugins.extras.editor.mini-files' },
  { import = 'lazyvim.plugins.extras.editor.mini-move' },
  -- { import = 'lazyvim.plugins.extras.formatting.prettier' })
  -- { import = 'lazyvim.plugins.extras.lang.clangd' },
  -- { import = 'lazyvim.plugins.extras.lang.cmake' },
  -- { import = 'lazyvim.plugins.extras.lang.docker' },
  -- { import = 'lazyvim.plugins.extras.lang.git' },
  -- { import = 'lazyvim.plugins.extras.lang.markdown' },
  -- { import = 'lazyvim.plugins.extras.lang.ocaml' },
  -- { import = 'lazyvim.plugins.extras.lang.python' },
  -- { import = 'lazyvim.plugins.extras.lang.r' },
  -- { import = 'lazyvim.plugins.extras.lang.toml' },
  -- { import = 'lazyvim.plugins.extras.lang.yaml' },
  { import = 'lazyvim.plugins.extras.ui.edgy' },
  { import = 'lazyvim.plugins.extras.util.dot' },
  { import = 'lazyvim.plugins.extras.util.gitui' },
  { import = 'plugins' },
}

require('lazy').setup({
  spec = LAZY_SPEC,
  local_spec = false,
  pkg = { enabled = false },
  rocks = { enabled = false },
  install = { colorscheme = { 'tokyonight' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
