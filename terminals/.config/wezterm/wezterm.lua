local wezterm = require("wezterm")
local act = wezterm.action
local home = wezterm.home_dir

--- returns true if current session is wayland
---@return boolean
local function is_wayland()
	local handle = io.popen("echo $WAYLAND_DISPLAY")
	if handle == nil then
		return false
	end

	local result = handle:read("*a")
	if result == nil then
		return false
	end

	handle:close()
	return result:find("wayland", 1, true) == 1
end

return {
	-- TODO: generalize this per shell
	-- don't launch login shell every time
	default_prog = { "/usr/bin/zsh" },

	font = wezterm.font_with_fallback({
		"Iosevka Term Nerd Font Mono",
		"JetBrains Mono Nerd Font",
	}),
	font_size = 13,
	underline_position = -3,
	strikethrough_position = 8,
	adjust_window_size_when_changing_font_size = false,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	color_scheme_dirs = { home .. "/.config/wezterm/themes/" },
	color_scheme = "base16",
	front_end = "OpenGL",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	custom_block_glyphs = true,
	scrollback_lines = 100000,
	cursor_blink_rate = 0,
	enable_wayland = is_wayland(),
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	audible_bell = "SystemBeep",
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_out_function = "EaseOut",
		fade_in_duration_ms = 150,
		fade_out_duration_ms = 150,
	},
	colors = { visual_bell = "#cc241d" },
	check_for_updates = false,
	mouse_bindings = {
		{
			event = {
				Down = {
					streak = 1,
					button = "Middle",
				},
			},
			mods = "NONE",
			action = wezterm.action.Nop, -- disable middle click paste
		},
	},
	disable_default_key_bindings = true,
	keys = {
		-- change font size
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },

		-- copy/paste
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },

		-- scrolling
		{ key = "PageUp", action = act.ScrollByPage(-1) },
		{ key = "PageDown", action = act.ScrollByPage(1) },
	},
}
