return {
	"nvim-treesitter/nvim-treesitter-context",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "VimEnter",
	opts = {
		mode = "topline",
	},
}
