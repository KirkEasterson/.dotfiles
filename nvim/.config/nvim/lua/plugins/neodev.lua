return {
	"folke/neodev.nvim",
	cond = not vim.g.started_by_firenvim,
	opts = {
		library = {
			plugins = {
				"nvim-dap-ui",
				"neotest",
			},
			types = true,
		},
	},
}
