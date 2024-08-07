-- Init theme, return it at the end
local theme = {}

-- Theme working directory
theme.wd = "~/.config/awesome/themes/gruvbox/"

-- wallpaper
theme.wallpaper = theme.wd .. "background.png"
-- awesome icon
theme.awesome_icon = theme.wd .. "awesome.png"

-- fonts
theme.base_font = "JetBrains Mono Nerd Font"
theme.font = theme.base_font .. " 9"
theme.taglist_font = theme.base_font .. " 11"
theme.icon_font = theme.base_font .. " 12"
theme.hotkeys_font = theme.base_font .. " 12"
theme.hotkeys_description_font = theme.font

-- colors
theme.bg_normal = "#1d2021"
theme.bg_focus = "#504945"
theme.fg_normal = "#ebdbb2"
theme.fg_urgent = "#cc241d"
theme.border_normal = "#3c3836"
theme.border_focus = "#fe8019"
-- theme.border_normal = "#000000"
-- theme.border_focus = theme.border_normal
theme.bg_urgent = theme.bg_normal
theme.bg_minimize = theme.bg_focus
theme.bg_systray = theme.bg_normal
theme.hotkeys_bg = theme.bg_normal
theme.fg_focus = theme.fg_normal
theme.fg_minimize = theme.fg_normal
theme.hotkeys_fg = theme.fg_normal
theme.hotkeys_border_color = theme.border_focus
theme.hotkeys_border_width = theme.border_width
theme.hotkeys_modifiers_fg = theme.fg_urgent

-- borders and gaps
theme.useless_gap = 0
theme.border_width = 3

-- taglist
theme.taglist_squares_sel = theme.wd .. "tags/focus.png"
theme.taglist_squares_unsel = theme.wd .. "tags/base.png"
theme.taglist_font = theme.taglist_font

-- tasklist
theme.tasklist_disable_icon = false

-- menu
theme.menu_submenu_icon = theme.wd .. "submenu.png"
theme.menu_height = 22
theme.menu_width = 160

-- left buttons
theme.titlebar_close_button_focus_hover = theme.wd .. "icons/titlebar/close_hover.png"
theme.titlebar_close_button_focus_press = theme.wd .. "icons/titlebar/close_hover.png"
theme.titlebar_close_button_focus = theme.wd .. "icons/titlebar/close_normal.png"
theme.titlebar_close_button_normal = theme.wd .. "icons/titlebar/empty.png"

theme.titlebar_minimize_button_focus_hover = theme.wd .. "icons/titlebar/minimize_hover.png"
theme.titlebar_minimize_button_focus_press = theme.wd .. "icons/titlebar/minimize_hover.png"
theme.titlebar_minimize_button_focus = theme.wd .. "icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_normal = theme.wd .. "icons/titlebar/empty.png"

theme.titlebar_maximized_button_focus_active_hover = theme.wd .. "icons/titlebar/maximized_hover_active.png"
theme.titlebar_maximized_button_focus_active_press = theme.wd .. "icons/titlebar/maximized_hover_active.png"
theme.titlebar_maximized_button_focus_active = theme.wd .. "icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_normal_active = theme.wd .. "icons/titlebar/empty.png"
theme.titlebar_maximized_button_focus_inactive_hover = theme.wd .. "icons/titlebar/maximized_hover_inactive.png"
theme.titlebar_maximized_button_focus_inactive_press = theme.wd .. "icons/titlebar/maximized_hover_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.wd .. "icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.wd .. "icons/titlebar/empty.png"

-- right buttons
theme.titlebar_floating_button_focus_active_hover = theme.wd .. "icons/titlebar/floating_hover_active.png"
theme.titlebar_floating_button_focus_active_press = theme.wd .. "icons/titlebar/floating_hover_active.png"
theme.titlebar_floating_button_focus_active = theme.wd .. "icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_normal_active = theme.wd .. "icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive_hover = theme.wd .. "icons/titlebar/floating_hover_inactive.png"
theme.titlebar_floating_button_focus_inactive_press = theme.wd .. "icons/titlebar/floating_hover_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.wd .. "icons/titlebar/empty.png"
theme.titlebar_floating_button_normal_inactive = theme.wd .. "icons/titlebar/empty.png"

theme.titlebar_sticky_button_focus_active_hover = theme.wd .. "icons/titlebar/sticky_hover_active.png"
theme.titlebar_sticky_button_focus_active_press = theme.wd .. "icons/titlebar/sticky_hover_active.png"
theme.titlebar_sticky_button_focus_active = theme.wd .. "icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_normal_active = theme.wd .. "icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive_hover = theme.wd .. "icons/titlebar/sticky_hover_inactive.png"
theme.titlebar_sticky_button_focus_inactive_press = theme.wd .. "icons/titlebar/sticky_hover_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.wd .. "icons/titlebar/empty.png"
theme.titlebar_sticky_button_normal_inactive = theme.wd .. "icons/titlebar/empty.png"

theme.titlebar_ontop_button_focus_active_hover = theme.wd .. "icons/titlebar/ontop_hover_active.png"
theme.titlebar_ontop_button_focus_active_press = theme.wd .. "icons/titlebar/ontop_hover_active.png"
theme.titlebar_ontop_button_focus_active = theme.wd .. "icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_normal_active = theme.wd .. "icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive_hover = theme.wd .. "icons/titlebar/ontop_hover_inactive.png"
theme.titlebar_ontop_button_focus_inactive_press = theme.wd .. "icons/titlebar/ontop_hover_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.wd .. "icons/titlebar/empty.png"
theme.titlebar_ontop_button_normal_inactive = theme.wd .. "icons/titlebar/empty.png"

-- layouts icons
theme.layout_fairh = theme.wd .. "layouts/fairh.png"
theme.layout_fairv = theme.wd .. "layouts/fairv.png"
theme.layout_floating = theme.wd .. "layouts/floating.png"
theme.layout_magnifier = theme.wd .. "layouts/magnifier.png"
theme.layout_max = theme.wd .. "layouts/max.png"
theme.layout_fullscreen = theme.wd .. "layouts/fullscreen.png"
theme.layout_tilebottom = theme.wd .. "layouts/tilebottom.png"
theme.layout_tileleft = theme.wd .. "layouts/tileleft.png"
theme.layout_tile = theme.wd .. "layouts/tile.png"
theme.layout_tiletop = theme.wd .. "layouts/tiletop.png"
theme.layout_spiral = theme.wd .. "layouts/spiral.png"
theme.layout_dwindle = theme.wd .. "layouts/dwindle.png"
theme.layout_cornernw = theme.wd .. "layouts/cornernw.png"
theme.layout_cornerne = theme.wd .. "layouts/cornerne.png"
theme.layout_cornersw = theme.wd .. "layouts/cornersw.png"
theme.layout_cornerse = theme.wd .. "layouts/cornerse.png"

-- YAWL required theme settings
theme.yawl_font = theme.font
theme.yawl_bg = "#458588"
theme.yawl_bg_ok = "#98971a"
theme.yawl_bg_nok = "#cc241d"
theme.yawl_fg = "#FFFFFF"
theme.yawl_spotify_absent = theme.bg_normal
theme.yawl_spotify_absent_fg = theme.fg_normal
theme.yawl_spotify_pause = "#d79921"
theme.yawl_spotify_play = "#d3869b"
theme.yawl_battery_full = theme.yawl_bg_ok
theme.yawl_battery_mid = "#d79921"
theme.yawl_battery_low = theme.yawl_bg_nok
theme.yawl_pomodoro_absent = theme.bg_normal
theme.yawl_pomodoro = theme.fg_normal
theme.yawl_pomodoro_working = "#d79921"
theme.yawl_pomodoro_break = "#689d6a"
theme.yawl_pomodoro_paused = "#cc241d"

-- Naughty
theme.naughty_bg_urgent = theme.fg_urgent

return theme
