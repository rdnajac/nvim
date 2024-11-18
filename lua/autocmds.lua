local au = vim.api.nvim_create_autocmd

au('LspAttach', {
  callback = function(event)
    lsp_zero.default_keymaps({ buffer = event.buf })
  end,
})

-- Automatically adjust window sizes after resizing the Vim window
au('VimResized', {
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- Automatically check time for file modifications when entering a window
au('BufWinEnter', {
  pattern = { '*' },
  callback = function()
    vim.cmd('checktime')
  end,
})

-- Highlight text after yanking
au('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 40 })
  end,
})

-- Automatically use the tokyonight colorscheme for Lua files
au('FileType', {
  pattern = 'lua',
  callback = function()
    vim.cmd('colorscheme tokyonight')
  end,
})
print('autocmds.lua loaded')
