vim.cmd([[
source ~/.vim/plugin/autocmds/filetypes.vim
]])

require('config.lazy')

vim.opt.completeopt = 'menu,popup,noselect'
