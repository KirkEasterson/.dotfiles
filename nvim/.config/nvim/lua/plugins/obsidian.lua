return {
	"epwalsh/obsidian.nvim",
	enabled = false,
	lazy = true,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre path/to/my-vault/**.md",
		"BufNewFile path/to/my-vault/**.md",
	},
	dependencies = {
		"hrsh7th/nvim-cmp",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
	},
}
