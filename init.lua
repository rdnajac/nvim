--- init.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end

LAZY_SPEC = {
  { dir = '~/.vim/plugin/config' },
  { 'folke/tokyonight.nvim' },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'andersevenrud/cmp-tmux',
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  { 'williamboman/mason.nvim', lazy = false, opts = {} },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'lua-language-server',
            'vim-language-server',
          },
        },
      },
    },
  },
}

require('lazy').setup({
  spec = LAZY_SPEC, -- pass in the spec directly
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/.lazy-lock.json',
  pkg = { enabled = false },
  rocks = { enabled = false },
  install = { missing = true, colorscheme = { 'tokyonight' } },
  ui = {
    wrap = false,
    border = 'rounded',
    icons = require('user.icons').lazy,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

vim.cmd([[
colorscheme tokyonight-night
]])
require('user.cmp')
require('user.lsp')
