return {
	"folke/trouble.nvim",
	enabled = false,
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
