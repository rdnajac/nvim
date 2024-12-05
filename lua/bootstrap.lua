if vim.env.PROF then
  local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
  vim.opt.rtp:append(snacks)
  require('snacks.profiler').startup({
    startup = {
      event = 'VimEnter',
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  })
end

-- bootstrap nvim configuration with lazyvim
package.loaded['lazyvim.config.options'] = true
-- declare LazyVim globals since we are disabling its default options

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.autoformat = true
vim.g.lazyvim_picker = 'auto'
vim.g.ai_cmp = true
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }
vim.g.root_lsp_ignore = { 'copilot' }
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0

require('user.autocmds')
require('user.commands')
require('user.keymaps')
require('user.options')
require('config.lazy')
