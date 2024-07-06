local wezterm = require("wezterm")
local act = wezterm.action

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

-- for nvim zen mode
wezterm.on("user-var-changed", function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
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

-- TODO: get this to adjust to system theme
-- wezterm.on("window-config-reloaded", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	local scheme = scheme_for_appearance(get_appearance())
-- 	if overrides.color_scheme ~= scheme then
-- 		overrides.color_scheme = scheme
-- 		window:set_config_overrides(overrides)
-- 	end
-- end)

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "dark"
end

local function scheme_for_appearance(appearance)
  os.execute("notify-send " .. appearance:lower()) -- debugging
  local mode = ""
  if appearance:lower():find("dark") then
    mode = "dark"
  else
    mode = "light"
  end
  return "Gruvbox " .. mode .. ", medium (base16)"
end

return {

  -- TODO: generalize this per shell
  -- don't launch login shell every time
  default_prog = { "/usr/bin/zsh" },

  font = wezterm.font_with_fallback({
    "ComicCodeLigatures Nerd Font",
    "JetBrains Mono Nerd Font",
  }),
  font_size = 12,
  -- line_height = 1.2,
  -- cell_width = 1.1,
  freetype_load_target = "Normal",
  -- warn_about_missing_glyphs = false, -- TODO: find which glyphs are missing
  underline_position = -3,
  strikethrough_position = 8,
  adjust_window_size_when_changing_font_size = false,
  harfbuzz_features = {
    "calt=0",
    "clig=0",
    "liga=0",
  },
  -- color_scheme = scheme_for_appearance(get_appearance()),
  color_scheme = "Gruvbox dark, medium (base16)",
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
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
  enable_wayland = is_wayland(),
  max_fps = 120,
  window_close_confirmation = "NeverPrompt",
  audible_bell = "SystemBeep",
  visual_bell = {
    fade_in_function = "EaseIn",
    fade_out_function = "EaseOut",
    fade_in_duration_ms = 150,
    fade_out_duration_ms = 150,
  },
  colors = {
    visual_bell = "#cc241d",
  },
  animation_fps = 1,
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
    -- basic tab management
    { key = "t", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },

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
    { key = "0", mods = "ALT", action = act.ResetFontSize },

    -- copy/paste
    { key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
    { key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
    { key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
    { key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
    { key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
    { key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },

    -- scrolling
    { key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
    { key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },

    -- for pane control in tmux/nvim
    { key = "h", mods = "SHIFT|CTRL", action = act.SendString("\x1b[27;6;72~") },
    { key = "j", mods = "SHIFT|CTRL", action = act.SendString("\x1b[27;6;74~") },
    { key = "k", mods = "SHIFT|CTRL", action = act.SendString("\x1b[27;6;75~") },
    { key = "l", mods = "SHIFT|CTRL", action = act.SendString("\x1b[27;6;76~") },

    -- for tab selection in nvim
    { key = "1", mods = "CTRL", action = act.SendString("\x1b[27;5;49~") },
    { key = "2", mods = "CTRL", action = act.SendString("\x1b[27;5;50~") },
    { key = "3", mods = "CTRL", action = act.SendString("\x1b[27;5;51~") },
    { key = "4", mods = "CTRL", action = act.SendString("\x1b[27;5;52~") },
    { key = "5", mods = "CTRL", action = act.SendString("\x1b[27;5;53~") },
    { key = "6", mods = "CTRL", action = act.SendString("\x1b[27;5;54~") },
    { key = "7", mods = "CTRL", action = act.SendString("\x1b[27;5;55~") },
    { key = "8", mods = "CTRL", action = act.SendString("\x1b[27;5;56~") },
    { key = "9", mods = "CTRL", action = act.SendString("\x1b[27;5;57~") },
    -- uncomment below to use for some terminal program
    -- { key = "0", mods = "CTRL", action = act.SendString("\x1b[27;5;48~") },

    -- -- for pane moving in tmux
    -- { key = '1',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;49~") },
    -- { key = '2',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;50~") },
    -- { key = '3',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;51~") },
    -- { key = '4',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;52~") },
    -- { key = '5',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;53~") },
    -- { key = '6',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;54~") },
    -- { key = '7',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;55~") },
    -- { key = '8',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;56~") },
    -- { key = '9',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;57~") },
    -- { key = '0',        mods = 'SHIFT|ALT',  action = act.SendString("\x1b[27;4;48~") },
  },
}
