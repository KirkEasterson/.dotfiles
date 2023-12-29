return {
	"benfowler/telescope-luasnip.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"L3MON4D3/LuaSnip",
	},
	keys = {
		{
			"<leader>fl",
			function()
				require("telescope").extensions.luasnip.luasnip()
			end,
			desc = "Telescope luasnip",
		},
	},
	opts = {
		extensions = {
			luasnip = {},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("luasnip")
	end,
}
