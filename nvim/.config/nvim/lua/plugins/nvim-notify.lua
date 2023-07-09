return {
	'rcarriga/nvim-notify',
	event = 'VeryLazy',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	cmd = "Notifications",
	keys = {
		{ "<leader>hi", function() require("notify").history() end },
		{ "<leader>hc", function() require("notify").dismiss() end },
	},
	opts = {
		fps = 30,
		render = "compact",
		stages = "slide",
	},
	config = function(_, opts)
		require('notify').setup(opts)
		vim.notify = require('notify')
	end,
}
