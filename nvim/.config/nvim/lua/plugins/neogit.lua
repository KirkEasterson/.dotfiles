return {
	"NeogitOrg/neogit",
	-- enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	cmd = "Neogit",
	keys = {
		{
			"<leader>gg",
			function()
				-- TODO: make this toggle neogit
				require("neogit").open()
			end,
			desc = "Open neogit",
		},
	},
	opts = {
		disable_signs = false,
		disable_hint = true,
		disable_commit_confirmation = true,
		disable_insert_on_commit = false,
		auto_refresh = true,
		use_per_project_settings = false,
		kind = "split",
		signs = {
			-- { CLOSED, OPENED }
			section = { "", "", },
			item = { "", "", },
			hunk = { "", "", },
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
