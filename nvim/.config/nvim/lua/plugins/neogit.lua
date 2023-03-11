return {
	'TimUntersberger/neogit',
	enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
	},
	cmd = 'Neogit',
	keys = {
		{ '<leader>gg',
			function()
				require('neogit').open()
			end
		},
	},
	opts = {
		kind = 'split',
		signs = {
			-- { CLOSED, OPENED }
			section = { ">", "v" },
			item = { ">", "v" },
			hunk = { "", "" },
		},
		integrations = {
			diffview = true,
		},
		mappings = {
			status = {
				["="] = "Toggle",
			},
		},
	},
}
