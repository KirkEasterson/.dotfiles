return {
	"utilyre/barbecue.nvim",
	version = "v0.4.*",
	dependencies = {
		-- "neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
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
