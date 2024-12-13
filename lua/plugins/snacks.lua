return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = [[ 
          The computing scientist's main challenge is 
          not to get confused by the complexities of his own making.
          ]],
      },
      formats = {
        key = function(item)
          return { { '[ ', hl = 'special' }, { item.key, hl = 'key' }, { ' ]', hl = 'special' } }
        end,
      },
      sections = {
        {
          section = 'terminal',
          -- cmd = 'pokeget unown-l unown unown-z unown-y 2> /dev/null'
          cmd = 'pokeget unown-n unown-v unown-i unown-m 2> /dev/null',
          padding = 1,
          width = 69,
        },
        { section = 'startup', padding = 1 },
        { section = 'keys', padding = 1, width = 42 },
        { section = 'header', padding = 1 },
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
  },
}
