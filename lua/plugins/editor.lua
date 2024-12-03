--- lua/plugin/editor.lua
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = false,
  },

  {
    'MagicDuck/grug-far.nvim',
    enabled = false,
  },
  {
    'ThePrimeagen/harpoon',
    keys = {
      { '<leader>h', false },
      {
        '<localleader>H',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      { '<leader>H', false },
      {
        '<localleader>h',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    },
  },
}
