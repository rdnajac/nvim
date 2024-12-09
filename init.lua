vim.cmd([[
cnoreabbrev Wq wqa!
cnoreabbrev wq wqa!
source ~/.vim/plugin/autocmds/filetypes.vim
]])

-- require('user.options')
require('config.lazy')
