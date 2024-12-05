--- lua/plugins/ui.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    opts = function(_, opts)
      opts.tabline = opts.sections
      opts.sections = {}
      opts.inactive_sections = {}
      opts.always_show_tabline = false
      -- lualine component to show captured events when the profiler is running
      table.insert(opts.sections.lualine_x, Snacks.profiler.status())
    end,
  },
  {
    'folke/snacks.nvim',
    opts = {
      -- dashboard configuration
      dashboard = {
        -- cwd = true,
        preset = {
          keys = {
            { icon = '💤 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
            { icon = '🔍 ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = '📝 ', key = 't', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = '📑 ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            -- stylua: ignore start
            { icon = '🛠 ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", },
            -- stylua: ignore end
            { icon = '🔮 ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '👾 ', key = 'x', desc = 'Lazy Extras', action = ':LazyExtras' },
            { icon = '❌ ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        formats = {
          key = function(item)
            return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
          end,
        },
        sections = {
          {
            section = 'terminal',
            cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null',
            padding = 1,
            width = 69,
          },
          { section = 'keys', padding = 1 },
          { section = 'recent_files', padding = 1 },
          { section = 'projects', padding = 1 },
          { section = 'startup' },
          -- {},
        },
      },
    },
    keys = {
      {
        '<localleader>\\',
        function()
          require('snacks').dashboard.open()
        end,
        desc = 'Open Snacks Dashboard',
      },
      {
        '<leader>ps',
        function()
          Snacks.profiler.scratch()
        end,
        desc = 'Profiler Scratch Bufer',
      },
    },
  },
}
