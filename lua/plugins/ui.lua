--- lua/plugins/ui.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
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
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = ' ',
              key = 'c',
              desc = 'Config',
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          {
            section = 'terminal',
            cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null',
            padding = 1,
            width = 69,
          },
          -- { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          -- { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          -- { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'keys', indent = 2, padding = 1 },
          { section = 'recent_files', indent = 2, padding = 1 },
          { section = 'projects', indent = 2, padding = 1 },
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
