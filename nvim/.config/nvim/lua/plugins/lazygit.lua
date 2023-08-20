return {
	'kdheepak/lazygit.nvim',
	cond = not vim.g.started_by_firenvim,
	cmd = {
		"LazyGit",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
		"LazyGitConfig",
	},
	keys = {
		{
			"<leader>lg",
			function()
				require('lazygit').lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
