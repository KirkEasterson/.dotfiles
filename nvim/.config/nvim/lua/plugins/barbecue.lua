return {
	"utilyre/barbecue.nvim",
	enabled = false,
	version = "*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	config = function()
		local palette = require('gruvbox.palette')
		require("barbecue").setup({
			theme = {
				normal = {
					bg = palette.colors.dark0_hard,
				}
			}
		})
	end,
}
