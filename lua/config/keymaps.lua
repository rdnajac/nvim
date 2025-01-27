-- keymaps.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua
---@diagnostic disable: unused-local
local map = vim.keymap.set
local del = vim.keymap.del

vim.cmd([[
" make mini-surround more like vim-surround
nmap S viwsa
vmap S sa
nmap sc sr
vmap sc sr

" XXX: WIP
nnoremap <localleader>bb i#!/bin/bash<CR>
inoremap <localleader>bb #!/bin/bash<CR>

" TODO: Move to ftplugin

" Insert hyperlink from clipboard
vmap <buffer> <localleader>k S]f]a()<Esc>hp

" Turn url into hyperlink
vmap <buffer> <localleader>K S)i[]<Left>
]])
