return {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_z = {
        function()
          return '󰒲'
        end,
        on_click = nil,
      },
    },
  },
}
