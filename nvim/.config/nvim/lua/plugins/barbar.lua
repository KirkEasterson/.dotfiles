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
		local palette = require('gruvbox.palette').get_base_colors({})
		vim.cmd("highlight BufferCurrent guibg=" .. palette.bg0)
		vim.cmd("highlight BufferCurrentSign guibg=" .. palette.bg0)
		vim.cmd("highlight BufferVisible guibg=" ..
			palette.bg1 .. " guifg=" .. palette.neutral_yellow)
		vim.cmd("highlight BufferVisibleSign guibg=" ..
			palette.bg1 .. " guifg=" .. palette.neutral_yellow)
		vim.cmd("highlight BufferInactive guibg=" .. palette.bg1 .. " guifg=" .. palette.gray)
		vim.cmd("highlight BufferInactiveSign guibg=" .. palette.bg1 .. " guifg=" .. palette.gray)
	end
}
