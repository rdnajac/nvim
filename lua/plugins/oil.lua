--- lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd = 'Oil',
  opts = {},
  keys = {
    { '-', '<CMD>Oil --float<CR>' },
  },
}
