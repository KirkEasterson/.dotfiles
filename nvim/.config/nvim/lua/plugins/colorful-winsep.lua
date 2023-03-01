return {
	"nvim-zh/colorful-winsep.nvim",
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	config = {
		highlight = {
			-- TODO: fix this highlighting
			-- bg = require('gruvbox.palette').dark0,
			-- fg = require('gruvbox.palette').neutral_orange,
		},
		interval = 30,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"CompetiTest",
			"NvimTree",
		},
	}

	,
}
