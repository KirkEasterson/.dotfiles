return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	keys = {
		{ '<leader>dt', ':TodoTelescope<CR>' },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		'nvim-telescope/telescope.nvim',
	},
	config = true,
}
