return {
	"kevinhwang91/nvim-bqf",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "qf",
	cmd = {
		"BqfEnabled",
		"BqfDisable",
		"BqfToggle",
		"BqfAutoToggle",
	},
	opts = {
		auto_enable = true,
		auto_resize_height = true,
		preview = {
			border = "rounded",
		},
	},
}