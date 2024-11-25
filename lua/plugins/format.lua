return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      'Q',
      function()
        require('conform').format({ async = true })
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      python = { 'black' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- format_on_save = { timeout_ms = 500 },
    -- formatters = {
    --   shfmt = {
    --     prepend_args = { '-i', '2' },
    --   },
    -- },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
