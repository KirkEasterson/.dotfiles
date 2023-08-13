return {
	"christoomey/vim-tmux-navigator",
	enabled = false,
	event = "VeryLazy",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	init = function()
		-- vim.api.nvim_set_var("mkdp_auto_close", 0)
	end,
}
