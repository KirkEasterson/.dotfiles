return {
	"nvim-treesitter/nvim-treesitter-context",
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
