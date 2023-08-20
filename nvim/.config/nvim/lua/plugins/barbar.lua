return {
	'romgrk/barbar.nvim',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim',
	},
	opts = {
		animation = false,
		auto_hide = true,
		tabpages = false,
		maximum_padding = 1,
		minimum_padding = 1,
	},
	config = function(_, opts)
		require('barbar').setup(opts)
		local palette = require('gruvbox.palette')
		vim.cmd("highlight BufferCurrent guibg=" .. palette.colors.dark0_hard)
		vim.cmd("highlight BufferCurrentSign guibg=" .. palette.colors.dark0_hard)
		vim.cmd("highlight BufferVisible guibg=" ..
			palette.colors.dark0_soft .. " guifg=" .. palette.colors.neutral_yellow)
		vim.cmd("highlight BufferVisibleSign guibg=" ..
			palette.colors.dark0_soft .. " guifg=" .. palette.colors.neutral_yellow)
		vim.cmd("highlight BufferInactive guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.gray)
		vim.cmd("highlight BufferInactiveSign guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.gray)
	end
}
