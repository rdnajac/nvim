-- autocmds.lua
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/autocmds.lua
local au = vim.api.nvim_create_autocmd

local function aug(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

au('FileType', {
  group = aug('no_vimcmd_hl'),
  pattern = { 'lua' },
  callback = function()
    ---@diagnostic disable-next-line: undefined-global
    if client then
      -- don't highlight vim code wrapped in vim.cmd([[]])
      -- client.server_capabilities.semanticTokensProvider = nil
      vim.api.nvim_set_hl(0, 'LspReferenceText', { default = true, bg = 'NONE', fg = 'NONE' })
    end
  end,
})

  -- autocmd FileType help,man hi Normal guibg=#1f2335
  --
au('FileType', {
  group = aug('window_highlights'),
  pattern = { 'help,man' },
  callback = function()
    -- make the window nornal bg 1f2335
    vim.cmd([[ 
    hi MyNormal guibg=#1f2335
    setlocal winhighlight=Normal:MyNormal
    ]])

  end,
})
