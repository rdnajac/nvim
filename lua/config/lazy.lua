-- snacks.profiler {{{
if vim.env.PROF then
  local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
  vim.opt.rtp:append(snacks)
  require('snacks.profiler').startup({
    startup = {
      -- event = 'VimEnter',
      -- event = "UIEnter",
      event = 'VeryLazy',
    },
  })
end
-- }}}

-- bootstrap lazy.nvim and set rtp {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  load(vim.fn.system('curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua'))()
else
  vim.opt.rtp:prepend(lazypath)
end
-- }}}

require('lazy').setup({
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    -- colorscheme (always load configs) {{{
    {
      'folke/tokyonight.nvim',
      lazy = false, -- make sure we load this during startup
      priority = 1000, -- and before all the other start plugins
      opts = {
        transparent = true,
        -- terminal_colors = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = false, bold = true },
          sidebars = 'transparent',
          floats = 'transparent',
        },
        on_highlights = function(hl, _)
          hl['@markup.raw.markdown_inline.comment'] = {
            fg = '#39ff14',
            bg = 'NONE',
          }
          hl['LspReferenceText'] = {
            bg = 'NONE',
          }
        end,
      },
    },
    -- }}}
    -- if we pass LAZY=1, don't load our configs
    { import = 'plugins', cond = not vim.env.LAZY },
    -- { dir = '~/.vim' },
  },
  install = { colorscheme = { 'tokyonight' } },
  ui = { border = 'rounded' },
  performance = {
    rtp = {
      -- reset = false,
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
