return {
	"romgrk/barbar.nvim",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		animation = false,
		auto_hide = true,
		tabpages = false,
		maximum_padding = 1,
		minimum_padding = 1,
	},
	config = function(_, opts)
		local palette = require("gruvbox").palette

		vim.cmd("highlight BufferCurrent guibg=" .. palette.bg0 .. " guifg=none")
		vim.cmd("highlight BufferCurrentSign guibg=" .. palette.bg0 .. " guifg=none")
		vim.cmd("highlight BufferVisible guibg=" .. palette.bg0 .. " guifg=" .. palette.neutral_yellow)
		vim.cmd("highlight BufferVisibleSign guibg=" .. palette.bg0 .. " guifg=" .. palette.neutral_yellow)
		vim.cmd("highlight BufferInactive guibg=" .. palette.bg0 .. " guifg=" .. palette.gray)
		vim.cmd("highlight BufferInactiveSign guibg=" .. palette.bg0 .. " guifg=" .. palette.gray)
	end,
}
