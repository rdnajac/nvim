-- options.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua
local set = vim.opt

set.autochdir = true
set.autoread = true
set.autowrite = true
set.breakindent = true
set.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
set.completeopt = 'menu,preview'
-- set.confirm = true
set.cursorline = true
set.foldopen:append('insert,jump')
set.ignorecase = true
set.iskeyword:append('_')
set.laststatus = 0
set.linebreak = true
set.mouse = 'a'
set.mousescroll = 'ver:2,hor:0'
set.number = true
set.numberwidth = 4
set.pumblend = 0
set.pumheight = 10
set.relativenumber = true
set.report = 0
set.ruler = false
set.scrolloff = 5
set.shiftround = true
set.shiftwidth = 8
set.showmatch = true
set.showmode = false
set.sidescrolloff = 0
set.signcolumn = 'yes'
set.smartcase = true
set.smoothscroll = true
set.spelllang = { 'en' }
set.splitbelow = true
set.splitkeep = 'screen'
set.splitright = true
set.tabstop = 8
set.termguicolors = true
set.timeoutlen = 420
set.undofile = true
set.undolevels = 10000
set.updatetime = 69
set.virtualedit = 'block'
set.whichwrap:append('<,>,[,],h,l')
set.wildmode = 'list:longest,full:'
set.winminwidth = 5
set.wrap = false

-- Lazy
set.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
set.foldlevel = 99
set.foldmethod = 'expr'
set.foldtext = ''
set.formatoptions = 'jrqlnt' -- default is `tcqj`, LazyVim uses `o` and `c`
set.inccommand = 'nosplit'
set.jumpoptions = 'view'
-- FIXME:
set.shortmess:append({ W = true, I = true, c = true, C = true })
set.smartindent = true
