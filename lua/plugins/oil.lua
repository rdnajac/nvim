return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd = 'Oil',
  opts = {},
  keys = {
    { '-', '<CMD>Oil<CR>' },
    { '<leader>e  ', '<CMD>Oil --left<CR>' },
    { '<leader>o', '<CMD>Oil --float<CR>' },
  },
}
