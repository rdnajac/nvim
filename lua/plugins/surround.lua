return {
  -- 'tpope/vim-surround',
  'echasnovski/mini.surround',
  opts = {
    mappings = {
      -- use these defaults since we're not using flash
      add = 'sa',
      delete = 'sd',
      find = 'sf',
      find_left = 'sF',
      highlight = 'sh',
      replace = 'sr',
      update_n_lines = 'sn',
    },
  },
}
