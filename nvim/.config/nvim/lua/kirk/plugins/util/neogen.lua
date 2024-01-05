return {
	"danymat/neogen",
	cond = not vim.g.started_by_firenvim,
	dependencies = "nvim-treesitter/nvim-treesitter",
	version = "*",
	cmd = "Neogen",
	keys = {
		{
			"<leader>ng",
			function()
				require("neogen").generate()
			end,
			desc = "Generate docs",
		},
	},
	opts = {},
}
