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
	config = function(_, opts)
		-- set conceal only for norg files
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { 'norg' },
			callback = function()
				-- TODO: experiment to see if I don't need all modes
				vim.opt.concealcursor = 'nvic'
				vim.opt.conceallevel = 3
			end,
		})
		require('neorg').setup(opts)
	end
}
