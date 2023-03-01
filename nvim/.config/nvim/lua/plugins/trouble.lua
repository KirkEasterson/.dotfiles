return {
	"folke/trouble.nvim",
	cmd = {
		'Trouble',
		'TroubleClose',
		'TroubleToggle',
		'TroubleRefresh',
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = {
		se_diagnostic_signs = true,
	},
}
