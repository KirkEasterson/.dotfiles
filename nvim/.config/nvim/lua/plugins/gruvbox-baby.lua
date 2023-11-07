return {
	"luisiacc/gruvbox-baby",
	dependencies = {
		'ellisonleao/gruvbox.nvim',
	},
	-- enabled = false,
	lazy = false,
	priority = 1000,
	config = function(_, _)
		local palette = require('gruvbox').palette

		vim.g.gruvbox_baby_telescope_theme = 0
		vim.g.gruvbox_baby_highlights = {
			WinSeparator = { bg = nil, fg = palette.gray },

			-- nvim tree
			NvimTreeNormal = { bg = palette.bg1, fg = palette.gray },
			NvimTreeWinSeparator = { bg = nil, fg = palette.bg1 },

			--  barbar
			BufferCurrent = { bg = palette.bg0, fg = nil },
			BufferCurrentSign = { bg = palette.bg0, fg = nil },
			BufferVisible = { bg = palette.bg1, fg = palette.neutral_yellow },
			BufferVisibleSign = { bg = palette.bg1, fg = palette.neutral_yellow },
			BufferInactive = { bg = palette.bg1, fg = palette.gray },
			BufferInactiveSign = { bg = palette.bg1, fg = palette.gray },

			-- incline
			InclineNormal = { bg = palette.bg2, fg = nil },
			InclineNormalNC = { bg = palette.bg1, fg = nil },
		}

		vim.cmd [[colorscheme gruvbox-baby]]
	end,
}
