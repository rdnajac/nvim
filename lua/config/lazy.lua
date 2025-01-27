-- snacks.profiler {{{
if vim.env.PROF then
  local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
  vim.opt.rtp:append(snacks)
  ---@diagnostic disable missing-field
  require('snacks.profiler').startup({
    startup = {
      -- event = 'VimEnter',
      -- event = "UIEnter",
      event = 'VeryLazy',
    },
  })
end
-- }}}

-- bootstrap lazy.nvim and set rtp {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end
-- }}}

require('lazy').setup({
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- if we pass LAZY=1, don't load our configs
    { import = 'plugins', cond = not vim.env.LAZY },
  },
  install = { colorscheme = { 'tokyonight' } },
  ui = { border = 'rounded' },
  performance = {
    rtp = {
      -- reset = false,
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
