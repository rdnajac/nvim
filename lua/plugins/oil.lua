return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  keys = { { '-', '<CMD>Oil<CR>' } },
  opts = {
    -- win_options = {
    --   winbar = '%!v:lua.get_oil_winbar()',
    -- },
    keymaps = {
      ['gi'] = {
        desc = 'Toggle file detail view',
        callback = function()
          detail = not detail
          if detail then
            require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
          else
            require('oil').set_columns({ 'icon' })
          end
        end,
      },
    },
  },
}
