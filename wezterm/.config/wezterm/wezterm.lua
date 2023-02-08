local wezterm = require('wezterm')
return {
	font = wezterm.font(
		'ComicCodeLigatures Nerd Font',
		{
			stretch = 'Condensed',
		}
	),
	font_size = 14,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
	color_scheme = "Gruvbox dark, medium (base16)",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	enable_scroll_bar = true, -- this might not be working
	scrollback_lines = 100000,
	cursor_blink_rate = 0,
	window_close_confirmation = 'NeverPrompt',
}
