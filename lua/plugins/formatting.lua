--- lua/plugin/formatting.lua
return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      python = { 'black' },
    },
    -- init = function()
    --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- end,
  },
}
