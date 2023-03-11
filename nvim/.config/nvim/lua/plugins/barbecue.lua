return {
	"utilyre/barbecue.nvim",
	lazy = false,
	version = "*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	cmd = "Barbecue",
	config = function()
		local palette = require('gruvbox.palette')
		require("barbecue").setup({
			theme = {
				normal = {
					bg = palette.colors.dark0_hard,
				},
			},
			symbols = {
				separator = "",
			},
			show_navic = false,
			attach_navic = false,
		})
	end,
}
