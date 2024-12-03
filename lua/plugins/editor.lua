--- lua/plugin/editor.lua
return {
  {
    'echasnovski/mini.files',
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
    keys = {
      { '<leader>fm', false },
      {
        '<leader>e',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files (Directory of Current File)',
      },
      { '<leader>fM', false },
      {
        '<leader>E',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'Open mini.files (cwd)',
      },
    },
  },
}
