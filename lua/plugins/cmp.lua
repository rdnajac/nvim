return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'andersevenrud/cmp-tmux',
    { 'zbirenbaum/copilot-cmp', opts = {} },
  },
  opts = {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    }, -- end snippet
    formatting = {
      expandable_indicator = true,
      fields = { 'menu', 'abbr' }, -- rm 'kind'
      format = function(entry, item)
        local menu_icon = require('user.icons').cmp
        item.menu = menu_icon[entry.source.name]
        return item
      end,
    }, -- end formatting
    sources = {
      { name = 'copilot' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'tmux' },
    }, -- end sources
  },
}
