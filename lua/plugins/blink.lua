-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/blink.lua
---@diagnostic disable: missing-fields
return {
  'Saghen/blink.cmp',
  ---@module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'super-tab',
      ['<C-K>'] = { 'select_prev' },
      ['<C-J>'] = { 'select_next' },
    },
    completion = {
      trigger = {
        prefetch_on_insert = false,
        show_in_snippet = true,
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
        -- TODO: a function like
        -- show_on_blocked_trigger_characters = function()
        --   local blocked = { ' ', '\n', '\t' }
        --   if vim.bo.filetype == 'markdown' then
        --     vim.list_extend(blocked, { '.', '/', '(', '[' })
        --   end
        --   return blocked
        -- end
        show_on_accept_on_trigger_character = true,
        show_on_insert_on_trigger_character = false,
        show_on_x_blocked_trigger_characters = { "'", '"', '(' },
      },

      list = {
        -- selection = 'preselect', -- automatically select the first item in the completion list
        selection = 'manual', -- will not select any item by default
        -- selection = 'auto_insert', --  will not select any item by default, and insert the completion items automatically when selecting them
        -- You may want to bind a key to the `cancel` command, which will undo the selection when using 'auto_insert'
      },

      menu = { border = 'rounded' },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- providers = function(ctx)
      --   local node = vim.treesitter.get_node()
      --   if vim.bo.filetype == 'lua' then
      --     return { 'lsp', 'path' }
      --   elseif node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
      --     return { 'buffer' }
      --   else
      --     return { 'lsp', 'path', 'snippets', 'buffer' }
      --   end
      -- end,
    },

    min_keyword_length = 5,
  },
}
