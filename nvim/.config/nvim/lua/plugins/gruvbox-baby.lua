return {
	"luisiacc/gruvbox-baby",
	dependencies = {
		'ellisonleao/gruvbox.nvim',
	},
	-- enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, _)
		vim.cmd [[colorscheme gruvbox-baby]]
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').get_base_colors().gray)
	end,
	init = function()
		vim.g.gruvbox_baby_telescope_theme = 0
	end,
}
