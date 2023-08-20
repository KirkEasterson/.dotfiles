return {
	"zbirenbaum/copilot-cmp",
	cond = not vim.g.started_by_firenvim,
	event = {
		"InsertEnter",
		"LspAttach"
	},
	dependencies = {
		"zbirenbaum/copilot.lua",
		'hrsh7th/nvim-cmp',
	},
	opts = {},
}
