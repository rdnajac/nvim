vim.cmd("source ~/.vim/vimrc")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Forget lazy loading and just load everything
require("lazy").setup({
	{ "folke/tokyonight.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "zbirenbaum/copilot.lua" },
	{ "zbirenbaum/copilot-cmp" },
})

vim.cmd("colorscheme tokyonight-night")

-- LSP setup
local lsp_zero = require("lsp-zero")

-- Function run every time a new LSP client attaches
local lsp_attach = function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end

-- Extend lspconfig with lsp-zero
lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Use mason to install and setup LSP servers
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		-- Make lua_ls aware of neovim builtins
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				on_init = function(client)
					lsp_zero.nvim_lua_settings(client, {})
				end,
			})
		end,
	},
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup()

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	formatting = lsp_zero.cmp_format({ details = true }),
})

-- # TODO add pcall
-- # add requires for colors
