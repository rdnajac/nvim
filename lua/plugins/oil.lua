--- lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  enabled = false,
  cmd = 'Oil',
  opts = {},
  keys = {
    { '-', '<CMD>Oil --float<CR>' },
  },
}
