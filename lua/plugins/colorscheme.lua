return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		on_colors = function(colors)
			colors.bg = "#000000"
		end,
	},
	config = function(plugin)
		require("tokyonight").setup(plugin.opts)
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
