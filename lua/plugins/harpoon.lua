--- lua/plugins/oil.lua
return {
  'ThePrimeagen/harpoon',
  keys = function()
    local keys = {
      {
        '<localleader>j',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<localleader>\\',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
      {
        '<localleader><Tab>',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'Harpoon Previous',
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<localleader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end
    return keys
  end,
}
