--- lua/plugins/coding.lua
return {
  {
    'echasnovski/mini.pairs',
    enabled = false,
  },
  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'S',
        -- replace = 'gsc',
      },
    },
  },
}
