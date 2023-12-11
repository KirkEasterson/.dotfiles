return {
	"ellisonleao/gruvbox.nvim",
	version = "*",
	lazy = false,
	priority = 1000,
	opts = {
		underline = true,
		undercurl = true,
		bold = true,
		italic = {
			operators = true,
		},
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.cmd({
			cmd = "colorscheme",
			args = {
				"gruvbox",
			},
		})
	end,
}
