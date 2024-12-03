local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
-- else
vim.opt.rtp:prepend(lazypath)
-- end

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
