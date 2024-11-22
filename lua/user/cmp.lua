local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'tmux' },
  }),
})
-- start cmp config
--     -- local menu_icon = {
--     -- },

--     mapping = cmp.mapping.preset.insert({
--       -- Simple tab complete
--       ['<Tab>'] = cmp.mapping(function(fallback)
--         local col = vim.fn.col('.') - 1

--         if cmp.visible() then
--           cmp.select_next_item({ behavior = 'select' })
--         elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--           fallback()
--         else
--           cmp.complete()
--         end
--       end, { 'i', 's' }),

--       ['<CR>'] = cmp.mapping.confirm({ select = true }),
--       ['<C-k>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-j>'] = cmp.mapping.scroll_docs(4),
--       ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
--     }),

--     preselect = 'item',
--     completion = { completeopt = 'menu,menuone,noinsert' },

--     formatting = {
--       -- changing the order of fields so the icon is the first
--       fields = { 'menu', 'abbr', 'kind' },

--       format = function(entry, item)
--         item.menu = menu_icon[entry.source.name]
--         return item
--       end,
--     },
--   },
-- },
-- }

-- --   -- Add 'lazydev' source for Lua files only
-- --   cmp.setup.filetype('lua', {
-- --     sources = cmp.config.sources({
-- --       { name = 'nvim_lsp' },
-- --       { name = 'buffer' },
-- --       { name = 'path' },
-- --       { name = 'tmux' },
-- --       { name = 'lazydev' },
-- --     }),
-- --   })

-- --   cmp.setup.cmdline({ '/', '?' }, {
-- --     mapping = cmp.mapping.preset.cmdline(),
-- --     sources = {
-- --       { name = 'buffer' },
-- --     },
-- --   })

-- --   cmp.setup.cmdline(':', {
-- --     mapping = cmp.mapping.preset.cmdline(),
-- --     sources = cmp.config.sources({
-- --       { name = 'path' },
-- --     }, {
-- --       { name = 'cmdline' },
-- --     }),
-- --   })
