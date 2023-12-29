-- keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set the leader key to space and local leader to space
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Key mappings to trigger WhichKey and other commands
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation using Alt + hjkl
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Center search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode after indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste over without replacing the clipboard content in visual mode
keymap("x", "p", [["_dP]])
--
-- Mouse menu commands for LSP functions
vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

-- Right-click and Tab to open the mouse menu
vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Open floating diagnostic window
vim.api.nvim_set_keymap('n', '?', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Buffer management key mappings
keymap('n', 'L', ':bnext<CR>', opts)
keymap('n', 'H', ':bprevious<CR>', opts)
keymap('n', '<leader>bl', ':ls<CR>', opts)

-- Easy saving and quitting mappings
keymap('i', 'jk', '<esc>', opts)
-- Map <leader>w to trim whitespace and save
keymap('n', '<leader>w', ':<C-u>%s/\\s\\+$//e<CR>:write<CR>', opts)
keymap('n', '<leader>q', ':wqall<cr>', opts)
keymap('n', '<F5>', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>', opts)

-- Single-line comment with Ctrl-c in insert mode
keymap('i', '<C-c>', '/*  */<Left><Left><Left>', opts)

-- Multi-line comment with Ctrl-Shift-C in insert mode
keymap('i', '<C-C>', '<Esc>O * <Esc>O/*<Esc>jo */<Up>', opts)

