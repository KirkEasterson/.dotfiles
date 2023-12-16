return {
	"jmbuhr/otter.nvim",
	enabled = false, -- I don't embed in md much
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = {
		"markdown",
		"text",
	},
	opts = {},
}
