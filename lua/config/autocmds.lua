-- autocmds.lua
local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

vim.cmd([[
  augroup myftplugin
  autocmd!
  autocmd FileType sh             setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c              setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda       setlocal sw=4 sts=4   expandtab
  autocmd FileType python         setlocal sw=4 sts=4   expandtab fdm=indent
  autocmd FileType tex            setlocal sw=2 sts=2   expandtab fdm=syntax
  autocmd FileType vim            setlocal sw=2 sts=2   expandtab fdm=marker
  autocmd FileType javascript     setlocal sw=2 sts=2   expandtab
  autocmd FileType html,css       setlocal sw=2 sts=2   expandtab
  autocmd FileType json,yaml,toml setlocal sw=2 sts=2   expandtab
  autocmd CmdwinEnter * quit
augroup END
]])

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
