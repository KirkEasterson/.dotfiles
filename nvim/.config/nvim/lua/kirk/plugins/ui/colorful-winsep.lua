return {
	"nvim-zh/colorful-winsep.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"ellisonleao/gruvbox.nvim",
	},
	event = "VeryLazy",
	opts = {
		interval = 5,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"Lazy",
			"CompetiTest",
			-- "NvimTree",
		},
		highlight = {
			bg = nil,
			fg = require("gruvbox").palette.bright_orange,
		},
	},
}
