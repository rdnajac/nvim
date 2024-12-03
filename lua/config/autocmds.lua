--- config/autocmds.lua
local au = vim.api.nvim_create_autocmd

au('VimEnter', {
  callback = function()
    vim.cmd([[echom '>^.^<']])
  end,
})
