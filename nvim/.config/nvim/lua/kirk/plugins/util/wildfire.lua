return {
	"sustech-data/wildfire.nvim",
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
}
