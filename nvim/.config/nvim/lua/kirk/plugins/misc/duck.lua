return {
	'tamton-aquib/duck.nvim',
	keys = {
		{
			'<leader>dh',
			function() require("duck").hatch("🪳") end,
			desc = "Create bug",
		},
		{
			'<leader>dc',
			function() require("duck").cook() end,
			desc = "Squash bug",
		},
	},
}
