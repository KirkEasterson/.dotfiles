return {
	'kdheepak/lazygit.nvim',
	cmd = {
		"LazyGit",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
		"LazyGitConfig",
	},
	keys = {
		{ "<leader>gg", function() require('lazygit').lazygit() end },
	},
}
