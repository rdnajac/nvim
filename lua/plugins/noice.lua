return {
  'folke/noice.nvim',
  enabled = false,
  -- dependencies = { 'rcarriga/nvim-notify' },
  opts = {
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = 'cmdline',
      opts = {}, -- global options for the cmdline. See section on views
      format = {
        cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
        filter = { pattern = '^:%s*!', icon = '!', lang = 'bash' },
      },
    },
    -- presets = {
    --   bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    --   long_message_to_split = true, -- long messages will be sent to a split
    --   inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --   lsp_doc_border = true, -- add a border to hover docs and signature help
    -- },
  },
}
