return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- sh = { 'shfmt' },
      python = { 'black' },
    },
  },
  formatters = {
    injected = { options = { ignore_errors = true } },
    -- shfmt = { prepend_args = { '-bn', '-ci' }, },
  },
}
