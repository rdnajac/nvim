-- autocmds.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/autocmds.lua
local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

au('FileType', {
  group = aug('formatoptions'),
  pattern = { '*' },
  callback = function()
    vim.opt_local.formatoptions:remove('o')
    vim.opt_local.formatoptions:remove('j')
  end,
})

au('CmdwinEnter', {
  group = aug('noCmdwin'),
  -- pattern = { '*' },
  callback = function()
    vim.cmd('quit')
  end,
})

au('FileType', {
  group = aug('no_vimcmd_hl'),
  pattern = { 'lua' },
  callback = function()
    if client then
      -- don't highlight vim code wrapped in vim.cmd([[]])
      -- client.server_capabilities.semanticTokensProvider = nil
      vim.api.nvim_set_hl(0, 'LspReferenceText', { default = true, bg = 'NONE', fg = 'NONE' })
    end
  end,
})

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
        desc = 'Quit oil buffer',
      })
    end)
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
  "autocmd FileType *                       setlocal formatoptions-=jo
  augroup END
]])
