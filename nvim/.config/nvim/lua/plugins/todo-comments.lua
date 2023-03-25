return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	cmd = {
		"TodoLocList",
		"TodoQuickFix",
		"TodoTelescope",
		"TodoTrouble",
	},
	-- keys = {
	-- 	{ '<leader>dt', ':TodoTelescope<CR>' },
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		-- 'nvim-telescope/telescope.nvim',
	},
	opts = {},
}
