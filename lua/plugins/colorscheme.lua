return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- and before all the other start plugins
  opts = {
    transparent = true,
    -- terminal_colors = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = false, bold = true },
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
}
