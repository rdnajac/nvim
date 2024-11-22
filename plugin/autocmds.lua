local au = vim.api.nvim_create_autocmd

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
