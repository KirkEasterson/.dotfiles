return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "FileType *.norg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Documents/notes",
						},
					},
				},
			},
		},
	}
}
