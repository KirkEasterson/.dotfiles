return {
	'ellisonleao/gruvbox.nvim',
	version = "*",
	lazy = false,
	priority = 1000,
	opts = {
		underline = true,
		undercurl = true,
		bold = true,
		italic = {
			operators = true,
		},
	},
	config = function(_, opts)
		local palette = require('gruvbox').palette

		opts.overrides = {
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

		require('gruvbox').setup(opts)
		-- vim.cmd [[colorscheme gruvbox]]
	end,
}
