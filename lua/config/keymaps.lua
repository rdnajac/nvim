-- keymaps.lua
local map = vim.keymap.set
local del = vim.keymap.del

map('n', '<leader>sp', "<cmd>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('data')})<CR>")

-- TODO:
-- rm LazyVim wk tab and buffer
map('c', '??', 'verbose set?<Left>', { noremap = true })
map('c', '!!', '!./%', { noremap = true })

vim.cmd([[
" format and write buffer
nnoremap Q <nop>
nnoremap Q gggqG:w<CR>

" stop pressing shift
nnoremap ; :
vnoremap ; :

" buffer navigation
nnoremap <tab>   :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

cnoreabbrev Wq wqa!
cnoreabbrev Qw wqa!
cnoreabbrev wq wqa!
cnoreabbrev qw wqa!

" completion
inoremap <silent> <localleader>o <C-x><C-o>
inoremap <silent> <localleader>f <C-x><C-f>
inoremap <silent> <localleader>i <C-x><C-i>
inoremap <silent> <localleader>l <C-x><C-l>
inoremap <silent> <localleader>n <C-x><C-n>
inoremap <silent> <localleader>t <C-x><C-]>
inoremap <silent> <localleader>u <C-x><C-u>

nnoremap <localleader>l :Lazy<CR>
]])
