return {
	"nvim-zh/colorful-winsep.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim',
	},
	opts = {
		highlight = {
			fg = require('gruvbox.palette').get_base_colors({}).bright_orange,
		},
		interval = 30,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"Lazy",
			"CompetiTest",
			-- "NvimTree",
		},
	},
}
