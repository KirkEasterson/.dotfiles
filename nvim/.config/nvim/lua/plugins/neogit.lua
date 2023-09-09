return {
	"NeogitOrg/neogit",
	cond = not vim.g.started_by_firenvim,
	-- enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
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
			desc = "Neogit",
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
			hunk = { "", "", },
			item = { "", "", },
			section = { "", "", },
		},
		integrations = {
			telescope = true,
			diffview = true,
		},
		mappings = {
			status = {
				["="] = "Toggle",
			},
		},
	},
}
