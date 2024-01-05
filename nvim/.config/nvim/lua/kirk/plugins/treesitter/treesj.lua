return {
	"Wansmer/treesj",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = {
		"TSJToggle",
		"TSJSplit",
		"TSJJoin",
	},
	keys = {
		{
			"<leader>J",
			function()
				require("treesj").toggle()
			end,
			desc = "Split/join line",
		},
	},
	opts = {
		use_default_keymaps = false,
	},
}
