return {
	"utilyre/barbecue.nvim",
	enabled = false,
	version = "*",
	dependencies = {
		-- "neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
		'ellisonleao/gruvbox.nvim',
	},
	event = "VeryLazy",
	cmd = "Barbecue",
	opts = {
		theme = {
			normal = {
				bg = require('gruvbox.palette').colors.dark0_hard,
			},
		},
		symbols = {
			separator = "",
		},
		show_navic = false,
		attach_navic = false,
	},
}
