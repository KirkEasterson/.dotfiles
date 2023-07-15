return {
	"f-person/git-blame.nvim",
	cmd = {
		"GitBlameCopyCommitURL",
		"GitBlameCopyFileURL",
		"GitBlameCopySHA",
		"GitBlameDisable",
		"GitBlameEnable",
		"GitBlameOpenCommitURL",
		"GitBlameOpenFileURL",
		"GitBlameToggle",
	},
	keys = {
		{
			"<leader>bt",
			"<Cmd>GitBlameToggle<CR>",
			desc = "Toggle git line blame",
		},
	},
	init = function ()
		vim.api.nvim_set_var("gitblame_enabled", 0)
		vim.api.nvim_set_var("gitblame_delay", 10)
	end,
}
