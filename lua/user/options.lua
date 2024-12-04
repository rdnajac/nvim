--- lua/plugin/user/options.lua
-- vim.cmd('silent! color tokyonight')
vim.cmd([[source ~/.vim/plugin/config/options.vim]])

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

local opt = vim.opt

opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus' -- Sync with system clipboard
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.splitkeep = 'screen'
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.termguicolors = true -- True color support
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = 'expr'
opt.foldtext = ''
