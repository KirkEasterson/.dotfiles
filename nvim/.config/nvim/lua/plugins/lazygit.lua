return {
	'kdheepak/lazygit.nvim',
	keys = {
		{ "<leader>gg", function() require('lazygit').lazygit() end },
	},
}
