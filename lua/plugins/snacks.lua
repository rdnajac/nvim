return {
  'folke/snacks.nvim',
  priority = 999,
  lazy = false,
  opts = function()
    local cmd
    if vim.env.LAZY then
      cmd = 'pokeget unown-l unown unown-z unown-y 2> /dev/null'
    else
      cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null'
    end

    return {
      -- dashboard configuration
      dashboard = {
        preset = {
          header = [[ "The computing scientist's main challenge is not to get confused by the complexities of his own making." ]],
          keys = {
            -- stylua: ignore start
            { icon = '💤 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
            { icon = '🔍 ', key = 'f', desc = 'Find File', action = ":Telescope find_files" },
            { icon = '📝 ', key = 't', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = '📑 ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '📚 ', key = '?', desc = 'Help', action = ":lua Snacks.dashboard.pick('help_tags')" },
            { icon = '⌨️ ', key = 'k', desc = 'Keymaps', action = ":lua Snacks.dashboard.pick('keymaps')" },
            { icon = '⚙️ ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", },
            { icon = '👨‍💻 ', key = 'd', desc = 'Data', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('data')})", },
            { icon = '🔮 ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '👾 ', key = 'x', desc = 'Lazy Extras', action = ':LazyExtras' },
            { icon = '❌ ', key = 'q', desc = 'Quit', action = ':qa' },
            -- stylua: ignore end
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
            cmd = cmd,
            padding = 1,
            width = 69,
          },
          { section = 'startup' },
          { section = 'keys', padding = 1, width = 42 },
        },
      },
    }
  end,
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
      desc = 'Profiler Scratch Buffer',
    },
  },
}