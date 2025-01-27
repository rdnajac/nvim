-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/blink.lua
---@diagnostic disable: missing-fields
return {
  'Saghen/blink.cmp',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = { default = { 'lsp', 'path', 'buffer' } },
    keymap = {
      preset = 'default',

      ['<C-j>'] = { 'select_next', 'fallback' },
      ['j'] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.select_next()
          end
        end,
        'fallback',
      },

      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['k'] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.select_prev()
          end
        end,
        'fallback',
      },

      -- `supertab`
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback',
      },
    },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      documentation = { window = { border = 'single' } },
      menu = { border = 'single', auto_show = false },
    },
    signature = { window = { border = 'single' } },

    -- trigger = {
    --   prefetch_on_insert = false,
    --   show_in_snippet = true,
    --   show_on_keyword = true,
    --   show_on_trigger_character = true,
    --   show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
    --   -- TODO: a function like
    --   -- show_on_blocked_trigger_characters = function()
    --   --   local blocked = { ' ', '\n', '\t' }
    --   --   if vim.bo.filetype == 'markdown' then
    --   --     vim.list_extend(blocked, { '.', '/', '(', '[' })
    --   --   end
    --   --   return blocked
    --   -- end
    --   show_on_accept_on_trigger_character = true,
    --   show_on_insert_on_trigger_character = false,
    --   show_on_x_blocked_trigger_characters = { "'", '"', '(' },
    -- },

    -- list = {
    --   selection = 'preselect', -- automatically select the first item in the completion list
    --   -- selection = 'manual', -- will not select any item by default
    --   -- selection = 'auto_insert', --  will not select any item by default, and insert the completion items automatically when selecting them
    --   -- You may want to bind a key to the `cancel` command, which will undo the selection when using 'auto_insert'
    -- },
  },
}
