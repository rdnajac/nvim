-- if this file is `require`d, then don't load lazyvim vim.opt.ons
package.loaded['lazyvim.config.options'] = true

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

vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = ''
vim.opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
vim.opt.formatoptions = 'jcroqlnt' -- tcqj
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.inccommand = 'nosplit'
vim.opt.jumpoptions = 'view'
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.smartindent = true
vim.opt.wildmode = 'longest:full,full'
