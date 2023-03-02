return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		'Trouble',
		'TroubleClose',
		'TroubleRefresh',
		'TroubleToggle',
	},
	keys = {
		{ "<leader><leader>o", "<cmd>TroubleToggle<CR>" },
		{ "gr", "<cmd>TroubleToggle lsp_references<CR>" },
		{ "gd", "<cmd>TroubleToggle lsp_definitions<CR>" },
		{ "gt", "<cmd>TroubleToggle lsp_type_definitions<CR>" },
	},
	config = {
		use_diagnostic_signs = true,
	},
}
