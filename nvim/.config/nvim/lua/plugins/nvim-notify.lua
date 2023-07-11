return {
	'rcarriga/nvim-notify',
	enabled = false,
	event = 'VeryLazy',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	cmd = "Notifications",
	keys = {
		{
			"<leader>hi",
			function() require("notify").history() end,
			desc = "Notification history",
		},
		{
			"<leader>hc",
			function() require("notify").dismiss() end,
			desc = "Dismiss notifications",
		},
		{
			"<leader>fh",
			function() require('telescope').extensions.notify.notify() end,
			desc = "Search notifications",
		},
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
