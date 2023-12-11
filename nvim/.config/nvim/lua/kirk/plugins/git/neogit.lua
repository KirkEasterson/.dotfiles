return {
	"NeogitOrg/neogit",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
		-- 'ibhagwan/fzf-lua',
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
		disable_commit_confirmation = true,
		disable_insert_on_commit = false,
		use_per_project_settings = false,
		kind = "split",
		signs = {
			-- { CLOSED, OPENED }
			hunk = { "", "" },
			item = { "", "" },
			section = { "", "" },
		},
		integrations = {
			telescope = true,
			diffview = true,
			-- fzf_lua = true,
		},
		mappings = {
			status = {
				["="] = "Toggle",
			},
		},
	},
}
