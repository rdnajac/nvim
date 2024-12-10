local set = vim.opt

set.autochdir = true
set.autoread = true
set.autowrite = true
set.breakindent = true
set.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'
set.completeopt = { 'menuone', 'noselect' }
set.confirm = true
set.cursorline = true
set.foldopen:append('insert,jump')
set.ignorecase = true
set.iskeyword:append('_')
set.laststatus = 0
set.linebreak = true
set.mouse = 'a'
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
set.winminwidth = 5
set.wrap = false
