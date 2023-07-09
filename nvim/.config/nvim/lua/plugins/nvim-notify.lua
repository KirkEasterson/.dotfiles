return {
	'rcarriga/nvim-notify',
	event = 'VeryLazy',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	cmd = "Notifications",
	keys = {
		{ "<leader>hi", function() require("notify").history() end },
		{ "<leader>hc", function() require("notify").dismiss() end },
		{ "<leader>fh", function() require('telescope').extensions.notify.notify() end },
	},
	opts = {
		fps = 30,
		render = "compact",
		stages = "slide",
	},
	config = function(_, opts)
		require('notify').setup(opts)
		vim.notify = require('notify')
		require("telescope").load_extension("notify")
	end,
}
