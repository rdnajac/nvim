-- autocmds.lua
local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

au('CmdwinEnter', {
  group = aug('noCmdwin'),
  pattern = { '*' },
  callback = function()
    vim.cmd('quit')
  end,
})

vim.cmd([[
  augroup ftplugin
  autocmd!
  autocmd FileType sh             setlocal sw=8 sts=8 noexpandtab wrap
  autocmd FileType c              setlocal sw=8 sts=8 noexpandtab
  autocmd FileType cpp,cuda       setlocal sw=4 sts=4   expandtab
  autocmd FileType python         setlocal sw=4 sts=4   expandtab fdm=indent
  autocmd FileType tex            setlocal sw=2 sts=2   expandtab fdm=syntax
  autocmd FileType vim,lua        setlocal sw=2 sts=2   expandtab fdm=marker fdl=0
  autocmd FileType javascript     setlocal sw=2 sts=2   expandtab
  autocmd FileType html,css,scss  setlocal sw=2 sts=2   expandtab
  autocmd FileType json,yaml,toml setlocal sw=2 sts=2   expandtab
augroup END
]])
