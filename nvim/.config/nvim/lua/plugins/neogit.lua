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
		disable_signs = false,
		disable_hint = true,
		disable_commit_confirmation = true,
		disable_insert_on_commit = false,
		auto_refresh = true,
		use_per_project_settings = false,
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
