-- options.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua
vim.g.mapleader = '\\'
vim.g.maplocalleader = ' '
vim.g.snacks_animate = false
vim.g.lazyvim_picker = 'fzf'
vim.g.autoformat = false
vim.g.lazyvim_cmp = 'blink.cmp'

local set = vim.opt

-- NOTE: These options are set by default by LazyVim
set.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
-- set.completeopt = 'menu,preview'
-- set.confirm = true
set.laststatus = 0
set.mousescroll = 'ver:2,hor:0'
set.pumblend = 0
-- set.ruler = false
set.scrolloff = 5
set.shiftwidth = 8
set.showmode = false
set.sidescrolloff = 0
set.signcolumn = 'yes'
set.smoothscroll = true
set.spelllang = { 'en' }
set.splitkeep = 'screen'
set.tabstop = 8
set.undofile = true
set.undolevels = 10000
set.virtualedit = 'block'
set.wildmode = 'list:longest,full:'
set.winminwidth = 5

set.foldlevel = 99
set.foldmethod = 'expr'
set.foldtext = ''
set.formatoptions = 'jrqlnt' -- default is `tcqj`, LazyVim uses `o` and `c`
set.inccommand = 'nosplit'
set.jumpoptions = 'view'
-- FIXME:
set.shortmess:append({ W = true, I = true, c = true, C = true })
