return {
	'luisiacc/gruvbox-baby',
	dependencies = {
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
	},
	config = function()
		-- vim.g.gruvbox_baby_transparent_mode = true
		vim.cmd [[colorscheme gruvbox-baby]]

		local palette = require('gruvbox.palette')
		-- winbar
		vim.cmd("highlight WinBar guibg=" .. palette.colors.dark2)
		vim.cmd("highlight WinBarNC guibg=" .. palette.colors.dark1)
		-- winseparator
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. palette.colors.gray)
	end,
}
