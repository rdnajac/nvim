LAZY_SPEC = {
  { dir = '~/.vim/' },
  { import = 'plugins' },
  { 'tpope/vim-surround' },
  {
    'stevearc/oil.nvim',
    lazy = true,
    cmd = 'Oil',
    opts = {},
    keys = {
      { '-', '<CMD>Oil<CR>' },
      { '<leader>o', '<CMD>Oil --float<CR>' },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
