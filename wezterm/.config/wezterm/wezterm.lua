local wezterm = require 'wezterm'
return {
	font = wezterm.font 'ComicCodeLigatures Nerd Font',
	font_size = 12,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	color_scheme = "Gruvbox dark, medium (base16)",
	hide_tab_bar_if_only_one_tab = true,
}
