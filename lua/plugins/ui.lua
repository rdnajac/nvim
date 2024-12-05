--- lua/plugins/ui.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    -- opts = function(_, opts)
    --   opts.tabline = opts.sections
    --   opts.sections = {}
    --   opts.inactive_sections = {}
    --   opts.always_show_tabline = false
    -- end,
  },
  {
    'folke/snacks.nvim',
    opts = {
      dashboard = {
        sections = {
          {
            section = 'terminal',
            cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null',
            padding = 1,
            width = 69,
          },
          { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },
    },
    keys = {
      {
        '<localleader><space>',
        function()
          require('snacks').dashboard.open()
        end,
        desc = 'Open Snacks Dashboard',
      },
    },
  },
}
