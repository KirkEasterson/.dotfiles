local month_themes = {
	[1] = "snow",
	[2] = "valentines",
	[3] = "st_pats",
	[4] = "spring",
	[5] = "spring",
	[6] = "summer",
	[7] = "summer",
	[8] = "summer",
	[9] = "leaves",
	[10] = "halloween",
	[11] = "thanksgiving",
	[12] = "xmas",
}

return {
	"folke/drop.nvim",
	cond = not vim.g.started_by_firenvim,
	lazy = false,
	opts = {
		theme = month_themes[os.date("*t").month],
		max = 25,
		-- screensaver = 1000 * 60 * 10, -- show after 10 minutes
		screensaver = false,
	},
	config = function(_, opts)
		local themes = require("drop.config").themes
		themes["valentines"] = {
			symbols = { "💘", "❤️", "💓", "💕", "💙", "💚", "💛",
				"💜", "💝", "💖", "♥️", "🤎",
				"🧡", "❣️", "😍", },
			colors = {},
		}
		themes["st_pats"] = {
			symbols = { "🍻", "🍺", "🌈", "☘️", "🍀", "🪙", },
			colors = {},
		}
		themes["halloween"] = {
			symbols = { "🎃", "👻", "💀", "😱", "🍬", "🍫", "👺",
				"👹", },
			colors = {},
		}
		themes["thanksgiving"] = {
			symbols = { "🦃", "🌽", "🍗", "🥕", "🍁", "🥧", },
			colors = {},
		}

		require("drop").setup(opts)
	end,
}
