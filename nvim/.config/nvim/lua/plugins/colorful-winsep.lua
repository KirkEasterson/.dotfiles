return {
	"nvim-zh/colorful-winsep.nvim",
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	config = function()
		local palette = require('gruvbox.palette')
		require('colorful-winsep').setup({
			highlight = {
				bg = palette.colors.dark0,
				fg = palette.colors.neutral_orange,
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
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. palette.colors.gray)
	end

}
