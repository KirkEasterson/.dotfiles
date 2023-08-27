local wezterm = require('wezterm')
local act = wezterm.action

-- for nvim zen mode
wezterm.on('user-var-changed', function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while (number_value > 0) do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return {
	font = wezterm.font_with_fallback({
		'ComicCodeLigatures Nerd Font',
		'Ubuntu Mono Nerd Font',
	}),
	font_size = 12,
	underline_position = -1,
	strikethrough_position = 8,
	adjust_window_size_when_changing_font_size = false,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
	color_scheme = "Gruvbox dark, medium (base16)",
	front_end = "OpenGL",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	scrollback_lines = 100000,
	cursor_blink_rate = 0,
	pane_focus_follows_mouse = true,
	enable_wayland = false,
	max_fps = 120,
	window_close_confirmation = 'NeverPrompt',
	audible_bell = 'SystemBeep',
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_out_function = "EaseOut",
		fade_in_duration_ms = 150,
		fade_out_duration_ms = 150,
	},
	colors = {
		visual_bell = "#cc241d",
	},
	animation_fps = 120,
	check_for_updates = false,
	disable_default_key_bindings = true,
	keys = {
		{ key = '+',        mods = 'CTRL',       action = act.IncreaseFontSize },
		{ key = '+',        mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
		{ key = '=',        mods = 'CTRL',       action = act.IncreaseFontSize },
		{ key = '=',        mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
		{ key = '=',        mods = 'SUPER',      action = act.IncreaseFontSize },
		{ key = '-',        mods = 'CTRL',       action = act.DecreaseFontSize },
		{ key = '-',        mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
		{ key = '-',        mods = 'SUPER',      action = act.DecreaseFontSize },
		{ key = '_',        mods = 'CTRL',       action = act.DecreaseFontSize },
		{ key = '_',        mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
		{ key = '0',        mods = 'CTRL',       action = act.ResetFontSize },
		{ key = '0',        mods = 'SHIFT|CTRL', action = act.ResetFontSize },
		{ key = '0',        mods = 'SUPER',      action = act.ResetFontSize },
		{ key = 'Copy',     mods = 'NONE',       action = act.CopyTo 'Clipboard' },
		{ key = 'c',        mods = 'SUPER',      action = act.CopyTo 'Clipboard' },
		{ key = 'C',        mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
		{ key = 'c',        mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
		{ key = 'Paste',    mods = 'NONE',       action = act.PasteFrom 'Clipboard' },
		{ key = 'v',        mods = 'SUPER',      action = act.PasteFrom 'Clipboard' },
		{ key = 'v',        mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
		{ key = 'V',        mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
		{ key = 'PageUp',   mods = 'SHIFT',      action = act.ScrollByPage(-1) },
		{ key = 'PageDown', mods = 'SHIFT',      action = act.ScrollByPage(1) },
	},
}
