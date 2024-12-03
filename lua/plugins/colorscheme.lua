--- lua/plugins/colorscheme.lua
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  { 'catppuccin/nvim', enabled = false },
}
