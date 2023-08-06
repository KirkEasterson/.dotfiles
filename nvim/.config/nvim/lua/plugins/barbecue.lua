return {
	"utilyre/barbecue.nvim",
	-- enabled = false,
	cond = not vim.g.started_by_firenvim,
	version = "*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
		'ellisonleao/gruvbox.nvim',
	},
	event = "VeryLazy",
	cmd = "Barbecue",
	opts = {
		theme = {
			normal = {
				bg = require('gruvbox.palette').colors.dark0_soft,
			},
		},
		symbols = {
			separator = "",
		},
		show_navic = false,
		attach_navic = false,
	},
}
