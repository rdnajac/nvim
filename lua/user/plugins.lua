LAZY_SPEC = {
  { dir = '~/.vim/' },
  { import = 'plugins' },
  { 'tpope/vim-surround' },
  {
    'stevearc/oil.nvim',
    lazy = true,
    cmd = 'Oil',
    opts = {},
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
