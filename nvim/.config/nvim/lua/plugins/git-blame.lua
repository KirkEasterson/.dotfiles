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
	init = function()
		-- for git-blame.nvim https://github.com/f-person/git-blame.nvim/issues/32#issuecomment-1124506718
		vim.g.gitblame_set_extmark_options = {
			hl_mode = "combine",
		}
	end,
	opts = {
		enabled = false,
		delay = 1,
	},
}
