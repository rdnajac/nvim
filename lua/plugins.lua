--- lua/plugins.lua
return {
  { dir = '~/.vim/plugin/config' },
  { 'folke/tokyonight.nvim' },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim' },
      { 'williamboman/mason.nvim', opts = {} },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'lua-language-server',
            'vim-language-server',
          },
        },
      },
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-cmdline' },
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-path' },
        },
      },
    },
  },
}
