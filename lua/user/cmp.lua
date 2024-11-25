local cmp = require('cmp')

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- preselect = 'item',
  completion = { completeopt = 'menu,menuone,noinsert' },

  mapping = cmp.mapping.preset.insert({
    ['<C-]>'] = cmp.mapping.scroll_docs(-4),
    ['<C-[>'] = cmp.mapping.scroll_docs(4),
    ['<Space>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item({ behavior = 'select' })
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
  }),

  ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
})

-- Add 'lazydev' source for Lua files only
cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'tmux' },
    { name = 'lazydev' },
  }),
})
