return {
  { 'akinsho/bufferline.nvim', enabled = false },
  -- { 'folke/noice.nvim', enabled = false },
  { 'lukas-reineke/indent-blankline.nvim', enabled = false },
  {
    'nvim-lualine/lualine.nvim',
    -- enabled = false,
    opts = function(_, opts)
      opts.tabline = opts.sections
      opts.sections = {}
      opts.inactive_sections = {}
      -- opts.always_show_tabline = false
      -- lualine component to show captured events when the profiler is running
      -- table.insert(opts.sections.lualine_x, Snacks.profiler.status())
    end,
  },
}
