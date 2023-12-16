return {
	"nvim-telescope/telescope-frecency.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>fy",
			function()
				require("telescope").extensions.frecency.frecency()
			end,
			desc = "Telescope frecency",
		},
	},
	opts = {
		extensions = {
			frecency = {
				default_workspace = "CWD",
				show_scores = true,
				show_unindexed = true,
				ignore_patterns = {
					"*.git/*",
					"*/tmp/*",
					"term://*",
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("frecency")
	end,
}
