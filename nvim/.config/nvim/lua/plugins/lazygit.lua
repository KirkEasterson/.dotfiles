return {
	'kdheepak/lazygit.nvim',
	enabled = false,
	keys = {
		{ "<leader>gg", function() require('lazygit').lazygit() end },
	},
}
