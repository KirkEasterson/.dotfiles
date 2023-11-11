return {
	"f-person/git-blame.nvim",
	cond = not vim.g.started_by_firenvim,
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
	opts = {
		enabled = false,
		delay = 1,
	},
}
