local M = {
  'folke/snacks.nvim', -- https://github.com/folke/snacks.nvim?tab=readme-ov-file#-features
}
---@type snacks.Config
M.opts = {
  indent = { enabled = false },

  -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  picker = { files = { follow = true } },

  -- https://github.com/folke/snacks.nvim/blob/main/docs/togglrre.md
  toggle = {},
}

-- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
M.opts.dashboard = {
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
    {
      -- stylua: ignore start
      { icon = ' ', key = 'f', desc = 'Find File',    action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'n', desc = 'New File',     action = ':ene | startinsert' },
      { icon = ' ', key = 'g', desc = 'Find Text',    action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'p', desc = 'Find Plugin',  action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('data') .. '/lazy'})", },
      { icon = ' ', key = 'c', desc = 'Config',       action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config'), follow = true})", },
      { icon = '󰒲 ', key = 'l', desc = 'Lazy',         action = ':Lazy',       enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'x', desc = 'LazyExtras',   action = ':LazyExtras', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'q', desc = 'Quit',         action = ':qa' },
      -- stylua: ignore end
    },
    { section = 'header', padding = 1, width = 69 },
  },
}

M.keys = {
  -- stylua: ignore start
  { '<leader>\\', function() require('snacks').dashboard.open() end, desc = 'Open Snacks Dashboard', },
  -- stylua: ignore end
}

M.init = function()
  require('snacks').toggle
    .new({
      id = 'virtual_text',
      name = 'Virtual Text',
      get = function()
        return vim.diagnostic.config().virtual_text
      end,
      set = function(state)
        vim.diagnostic.config({ virtual_text = state })
      end,
    })
    :map('<leader>uv', { desc = 'Toggle Virtual Text' })
end

return M
