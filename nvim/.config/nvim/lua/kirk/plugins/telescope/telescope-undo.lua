return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	version = "*",
	keys = {
		{
			"<leader>fu",
			function()
				require("telescope").extensions.undo.undo()
			end,
			desc = "Telescope undo",
		},
	},
	opts = {
		extensions = {
			undo = {
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
	end,
}
