local month_themes = {
	[1] = "snow",
	[2] = "snow",
	[3] = "spring",
	[4] = "spring",
	[5] = "spring",
	[6] = "summer",
	[7] = "summer",
	[8] = "summer",
	[9] = "leaves",
	[10] = "leaves",
	[11] = "leaves",
	[12] = "xmas",
}

return {
	"folke/drop.nvim",
	event = "VimEnter",
	opts = {
		theme = month_themes[os.date("*t").month],
		max = 25,
		-- screensaver = 1000 * 60 * 10, -- show after 10 minutes
		screensaver = false,
	},
}
