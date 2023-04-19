return {
	'tamton-aquib/duck.nvim',
	keys = {
		{ '<leader>dh', function() require("duck").hatch("🕷") end },
		{ '<leader>dc', function() require("duck").cook() end },
	},
}
