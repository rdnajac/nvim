return {
  { dir = '~/.vim' },
  { 'folke/tokyonight.nvim' },
  { 'VonHeikemeVn/lsp-zero.nvim' },
  { 'williamboman/mason.nvim', lazy = false, opts = {} },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },
}
