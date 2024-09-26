local icons = require("icons")

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "garymjr/nvim-snippets" },
		{ "rafamadriz/friendly-snippets" },
	},
	{ "folke/ts-comments.nvim" },
	{ "echasnovski/mini.ai" },
	{ "echasnovski/mini.pairs" },

	config = function()
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()

		local function expand_snippet(args)
			vim.snippet.expand(args.body)
		end

		cmp.setup({
			snippet = {
				expand = expand_snippet,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "snippets" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if vim.snippet.jumpable(1) then
						vim.snippet.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if vim.snippet.jumpable(-1) then
						vim.snippet.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			formatting = {
				format = function(entry, item)
					if icons.kinds[item.kind] then
						item.kind = icons.kinds[item.kind] .. item.kind
					end

					local widths = {
						abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
						menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
					}

					for key, width in pairs(widths) do
						if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
							item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
						end
					end

					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			sorting = defaults.sorting,
		})

		require("ts-comments").setup({})
		require("nvim-snippets").setup({
			friendly_snippets = true,
		})

		require("mini.pairs").setup({
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		})

		-- Better text-objects setup (if you want to include it)
		local ai = require("mini.ai")
		ai.setup({
			n_lines = 500,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				d = { "%f[%d]%d+" },
				e = {
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*()$",
				},
				u = ai.gen_spec.function_call(),
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
			},
		})
	end,
}
