--- lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  -- lazy = false,
  cmd = 'Oil',
  opts = {},
  keys = {
    { '-', '<CMD>Oil --float<CR>' },
  },
}
