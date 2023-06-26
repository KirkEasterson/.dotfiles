return {
	"nvim-neorg/neorg",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-cmp",
	},
	cmd = {
		"Neorg",
	},
	ft = {
		"norg",
	},
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
					name = "[Norg]",
				},
			},
			["core.integrations.nvim-cmp"] = {},
			["core.concealer"] = {},
			["core.export"] = {},
			["core.keybinds"] = {
				-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
				config = {
					default_keybinds = true,
					neorg_leader = "<Leader><Leader>",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/notes",
					},
					default_workspace = "notes",
				},
			},
		},
	},
}
