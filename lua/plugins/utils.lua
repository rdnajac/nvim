return {
  { 'max397574/better-escape.nvim', opts = {} },
  {
    'chrisgrieser/nvim-genghis',
    opts = {},
    init = function()
      -- register comands on initialization
      vim.api.nvim_create_user_command('Delete', function()
        require('genghis').trashFile()
      end, { desc = 'Delete the current file and move it to trash' })
    end,
  },
}
