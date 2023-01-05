local palette = require('gruvbox.palette')

require("colorful-winsep").setup({
	highlight = {
		bg = palette.dark0,
		fg = palette.neutral_orange,
	},
	interval = 30,
	no_exec_files = {
		"packer",
		"TelescopePrompt",
		"mason",
		"CompetiTest",
		"NvimTree",
	},
})
