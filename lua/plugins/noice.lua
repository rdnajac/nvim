return {
  'folke/noice.nvim',
  opts = {
    cmdline = {
      enabled = true,
      view = 'cmdline',
      format = {
        cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
        filter = { pattern = '^:%s*!', icon = '!', lang = 'bash' },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
}
