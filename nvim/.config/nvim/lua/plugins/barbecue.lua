return {
	"utilyre/barbecue.nvim",
	version = "*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		local palette = require('gruvbox.palette')
		require("barbecue").setup({
			theme = {
				normal = {
					bg = palette.dark0_hard,
				}
			}
		})
	end,
}
