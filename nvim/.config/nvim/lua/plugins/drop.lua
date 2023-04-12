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

-- local custom_theme = {
-- 	symbols = { "❄️ ", " ", "❅", "❇", "*", "." },
-- 	colors = {
-- 		"#c6fbff",
-- 		"#abf0ff",
-- 		"#99c4ce",
-- 		"#73999a",
-- 		"#628485",
-- 	},
-- }

return {
	"folke/drop.nvim",
	event = "VimEnter",
	opts = {
		theme = month_themes[os.date("*t").month],
	},
}
