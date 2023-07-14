return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	cmd = {
		"Gitsigns",
	},
	keys = {
		{
			'<leader>gb',
			function()
				require('gitsigns').toggle_current_line_blame()
			end,
			desc = "Toggle line blame",
		},
	},
	opts = {
		signs = {
			add = { text = "▌" },
			change = { text = "▌" },
			topdelete = { text = "▔" },
			delete = { text = "▁" },
			changedelete = { text = "▁" },
			untracked = { text = "▌" }
		},
		current_line_blame_opts = {
			delay = 10,
		},
	},
}
