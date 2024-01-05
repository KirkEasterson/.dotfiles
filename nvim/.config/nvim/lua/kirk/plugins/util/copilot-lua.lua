return {
	"zbirenbaum/copilot.lua",
	enabled = false,
	cond = not vim.g.started_by_firenvim,
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = false,
		},
		panel = {
			enabled = false,
		},
	},
}
