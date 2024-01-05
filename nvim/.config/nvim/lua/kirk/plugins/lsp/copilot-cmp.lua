return {
	"zbirenbaum/copilot-cmp",
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	event = {
		"InsertEnter",
		"LspAttach",
	},
	dependencies = {
		"zbirenbaum/copilot.lua",
		"hrsh7th/nvim-cmp",
	},
	opts = {},
}
