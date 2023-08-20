return {
	"nvim-zh/colorful-winsep.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim',
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
	config = function(_, opts)
		require('colorful-winsep').setup(opts)
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').colors.gray)
	end

}
