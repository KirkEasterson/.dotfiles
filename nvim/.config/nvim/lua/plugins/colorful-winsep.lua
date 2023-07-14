return {
	"nvim-zh/colorful-winsep.nvim",
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	opts = {
		highlight = {
			bg = require('gruvbox.palette').colors.dark0,
			fg = require('gruvbox.palette').colors.neutral_orange,
		},
		interval = 30,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"CompetiTest",
			"NvimTree",
		},
	},
	init = function()
		-- TODO: figure out if this is needed
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').colors.gray)
	end

}
