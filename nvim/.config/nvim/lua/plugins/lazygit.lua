return {
	'kdheepak/lazygit.nvim',
	enabled = false,
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
