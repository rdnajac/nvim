-- autocmds.lua
local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

au('FileType', {
  group = aug('close_with_q'),
  pattern = {
    'oil',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set('n', 'q', function()
        vim.cmd('close')
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})

au('FileType', {
  group = aug('lua_fold'),
  pattern = { 'lua' },
  callback = function()
    vim.opt_local.foldlevel = 1
    vim.opt_local.fdm = 'marker'
  end,
})
