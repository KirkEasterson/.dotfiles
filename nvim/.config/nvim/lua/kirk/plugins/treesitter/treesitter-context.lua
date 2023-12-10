return {
	"nvim-treesitter/nvim-treesitter-context",
	cond = not vim.g.started_by_firenvim,
	dependencies = "nvim-treesitter/nvim-treesitter",
	cmd = {
		"TSContextEnable",
		"TSContextDisable",
		"TSContextToggle",
	},
	opts = {
		mode = "topline",
	},
}
