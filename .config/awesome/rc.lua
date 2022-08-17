-- TODO:
--	- in general: CLEAN THIS UP
--		- THIS IS EMBARASSING
--	- deconstruct this rc into multiple files
--	- eventually build a widget with options for choosing kb layout
--	- automate trackpad config outside of configs
--		- put the file in /etc/X11/something in ansible
--	- debug flameshot
--	- change height of windows in a keybinding

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- widgets
-- https://github.com/streetturtle/awesome-wm-widgets
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local separator = wibox.widget {
	widget = wibox.widget.separator,
	orientation = "vertical",
	forced_width = 10,
	color = "#353535",
}

-- scratchpad terminal
-- https://github.com/notnew/awesome-scratch
local scratch = require("awesome-scratch.scratch")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err) })
		in_error = false
	end)
end
-- }}}

-- THEME
beautiful.init("~/.config/awesome/themes/gruvbox/theme.lua")

-- DEFAULT EDITOR
local terminal = "alacritty"
local browser = "firefox"
local file_manager = "pcmanfm"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- MOD KEY
modkey = "Mod4"

-- AVAILABLE LAYOUTS
-- TODO: Reduce this to ones that I actually want
awful.layout.layouts = {
	awful.layout.suit.tile,
	-- awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
	awful.layout.suit.floating,
}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after = { menu_terminal }
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		}
	})
end

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock('%a %d %b %Y, wk %V, %T', 1)
local cw = calendar_widget({
	placement = 'top_right',
})
mytextclock:connect_signal("button::press",
	function(_, _, _, button)
		if button == 1 then cw.toggle() end
	end)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{ raise = true }
			)
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end))

awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function() awful.layout.inc(1) end),
		awful.button({}, 3, function() awful.layout.inc(-1) end),
		awful.button({}, 4, function() awful.layout.inc(1) end),
		awful.button({}, 5, function() awful.layout.inc(-1) end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.noempty,
		buttons = taglist_buttons,
		style   = {
			shape = gears.shape.rounded_rect,
			spacing = 2,
		},
		layout  = {
			layout = wibox.layout.fixed.horizontal
		},
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style   = {
			shape = gears.shape.rounded_rect,
		},
		layout  = {
			spacing = 5,
			max_widget_size = awful.screen.focused().workarea.width * 0.12,
			layout = wibox.layout.flex.horizontal
		},
	}

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 20 })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			logout_menu_widget({
				onlock = function() awful.spawn.with_shell('light-locker-command -l') end
			}),
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			separator,
			wibox.widget.textbox(' '),
			mykeyboardlayout,
			separator,
			wibox.widget.textbox('RAM:'),
			ram_widget({}),
			separator,
			wibox.widget.textbox('CPU: '),
			awful.widget.watch([[bash -c "cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000 \"°C\"}'"]], 1),
			wibox.widget.textbox(' '),
			cpu_widget({}),
			separator,
			brightness_widget({
				type = "icon_and_text",
				program = "brightnessctl",
				percentage = true,
				base = 70,
				timeout = 1,
			}),
			separator,
			volume_widget({
				step = 10,
				widget_type = 'icon_and_text',
			}),
			separator,
			battery_widget({
				path_to_icons = "/usr/share/icons/Papirus-Dark/symbolic/status/",
				show_current_level = true,
			}),
			separator,
			wibox.widget.textbox('  '),
			mytextclock,
			separator,
			s.mylayoutbox,
		},
	}

end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function() mymainmenu:toggle() end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

	awful.key({ modkey, }, "j",
		function()
			awful.client.focus.byidx(1)
		end,
		{ description = "focus next by index", group = "client" }
	),

	awful.key({ modkey, }, "k",
		function()
			awful.client.focus.byidx(-1)
		end,
		{ description = "focus previous by index", group = "client" }
	),

	awful.key({ modkey, }, "w", function() awful.util.spawn(browser) end,
		{ description = "open browser", group = "kirk" }),

	awful.key({ modkey, }, "e", function() awful.util.spawn(file_manager) end,
		{ description = "open file manager", group = "kirk" }),

	awful.key({ modkey, "Shift" }, "e", function() awful.util.spawn(terminal .. " -e lfrun") end,
		{ description = "open termainl file manager", group = "kirk" }),

	awful.key({ modkey, }, "x", function() awful.util.spawn("light-locker-command -l") end,
		{ description = "lock screen", group = "kirk" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
		{ description = "swap with next client by index", group = "client" }),

	awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
		{ description = "swap with previous client by index", group = "client" }),

	awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
		{ description = "focus the next screen", group = "screen" }),

	awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
		{ description = "focus the previous screen", group = "screen" }),

	awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }),

	-- awful.key({ modkey, }, "Tab",
	-- 	function()
	-- 		awful.client.focus.history.previous()
	-- 		if client.focus then
	-- 			client.focus:raise()
	-- 		end
	-- 	end,
	-- 	{ description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
		{ description = "open a terminal", group = "launcher" }),

	awful.key({ modkey, "Shift" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),

	awful.key({ modkey, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" }),


	awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
		{ description = "increase master width factor", group = "layout" }),

	awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
		{ description = "decrease master width factor", group = "layout" }),

	awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
		{ description = "increase the number of master clients", group = "layout" }),

	awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
		{ description = "decrease the number of master clients", group = "layout" }),

	awful.key({ modkey, "Control" }, "h", function() awful.tag.viewprev() end,
		{ description = "move to next tag", group = "layout" }),

	awful.key({ modkey, "Control" }, "l", function() awful.tag.viewnext() end,
		{ description = "move to previous tag", group = "layout" }),

	awful.key({ modkey }, "n", function() awful.spawn("wifimenu") end,
		{ description = "show wifi menu", group = "client" }),

	-- Menubar
	awful.key({ modkey }, "p", function() awful.spawn("rofi -show drun") end,
		{ description = "show program launcher", group = "launcher" }),

	-- gaps
	awful.key({ modkey }, "Tab", function() awful.tag.incgap(-2) end,
		{ description = "decrease gaps", group = "gaps" }),

	awful.key({ modkey, "Shift" }, "Tab", function() awful.tag.incgap(2) end,
		{ description = "increase gaps", group = "gaps" }),

	awful.key({ modkey, "Control" }, "Tab", function() awful.tag.setgap(15) end,
		{ description = "reset gaps", group = "gaps" }),

	awful.key({ modkey, "Control", "Shift" }, "Tab", function() awful.tag.setgap(0) end,
		{ description = "reset gaps", group = "gaps" }),

	-- volume keys
	awful.key({}, "XF86AudioRaiseVolume",
		function() volume_widget:inc() end,
		{ description = "raise volume", group = "volume" }),

	awful.key({}, "XF86AudioLowerVolume",
		function() volume_widget:dec() end,
		{ description = "lower volume", group = "volume" }),

	awful.key({}, "XF86AudioMute",
		function() volume_widget:toggle() end,
		{ description = "mute audio", group = "volume" }),

	awful.key({}, "XF86AudioMicMute",
		function() awful.util.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle", false) end,
		{ description = "mute mic", group = "volume" }),

	-- media keys
	awful.key({}, "XF86AudioPlay", function() awful.util.spawn("playerctl play-pause", false) end,
		{ description = "play/pause media", group = "media" }),

	awful.key({}, "XF86AudioStop", function() awful.util.spawn("playerctl stop", false) end,
		{ description = "stop media", group = "media" }),

	awful.key({}, "XF86AudioNext", function() awful.util.spawn("playerctl next", false) end,
		{ description = "next in media", group = "media" }),

	awful.key({}, "XF86AudioPrev", function() awful.util.spawn("playerctl previous", false) end,
		{ description = "previous in media", group = "media" }),

	-- brightness keys
	awful.key({}, "XF86MonBrightnessDown", function() awful.util.spawn("brightnessctl --min-val=5 -q set 5%-", false) end
		,
		{ description = "decrease monitor brightness", group = "brightness" }),

	awful.key({}, "XF86MonBrightnessUp", function() awful.util.spawn("brightnessctl -q set 5%+", false) end,
		{ description = "increase monitor brightness", group = "brightness" }),

	-- screenshots
	awful.key({}, "Print", function() awful.util.spawn("flameshot gui", false) end,
		{ description = "screenshot selected area", group = "screenshot" }),

	awful.key({ "Shift" }, "Print", function() awful.util.spawn("flameshot full -p $HOME/Pictures/screenshots", false) end,
		{ description = "screenshot selected full screen", group = "screenshot" }),

	-- keyboard layouts
	awful.key({ modkey, "Shift" }, "a", function() awful.util.spawn("setxkbmap us", false) end,
		{ description = "set us keyboard layout", group = "keyboard" }),

	awful.key({ modkey, "Shift" }, "s", function() awful.util.spawn("setxkbmap se", false) end,
		{ description = "set swedish keyboard layout", group = "keyboard" }),

	awful.key({ modkey, "Shift" }, "g", function() awful.util.spawn("setxkbmap no", false) end,
		{ description = "set norwegian keyboard layout", group = "keyboard" }),

	-- scratchpads
	-- TODO: find out how to make tmux script work
	awful.key({ modkey, }, "space",
		function() scratch.toggle("alacritty --class scratch-main -t scratch-main -e tmux a -t scratchpad; select-window -t main"
				, { instance = "scratch-main" }, true)
		end,
		{ description = "open scratch terminal", group = "kirk" }),

	awful.key({ modkey, }, "c",
		function() scratch.toggle("alacritty --class scratch-py -t scratch-py -e tmux a -t scratchpad; select-window -t calculator"
				, { instance = "scratch-py" }, true)
		end,
		{ description = "open calculator", group = "kirk" })

)

clientkeys = gears.table.join(
	awful.key({ modkey, }, "f",

		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ description = "toggle fullscreen", group = "client" }),

	awful.key({ modkey, }, "q", function(c) c:kill() end,
		{ description = "close", group = "client" }),

	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }),

	awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
		{ description = "move to master", group = "client" }),

	awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
		{ description = "move to screen", group = "client" }),

	awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
		{ description = "toggle keep on top", group = "client" }),

	awful.key({ modkey, }, "m",
		function(c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{ description = "(un)maximize", group = "client" }),

	awful.key({ modkey, "Control" }, "m",
		function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{ description = "(un)maximize vertically", group = "client" }),

	awful.key({ modkey, "Shift" }, "m",
		function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{ description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,

		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{ description = "view tag #" .. i, group = "tag" }),

		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{ description = "toggle tag #" .. i, group = "tag" }),

		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{ description = "move focused client to tag #" .. i, group = "tag" }),

		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{ description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(

	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),

	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),

	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {

	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		},
	},
	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
				"scratch-main",
				"scratch-py",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
				"Lock Screen — 1Password",
				"zoom",
				"Zoom Cloud Meetings",
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = {
			floating = true,
			placement = awful.placement.centered,
		},
	},
	{
		rule_any = {
			instance = { "scratch-main" },
			class = { "scratch-main" },
		},
		properties = {
			skip_taskbar = false,
			floating = true,
			ontop = false,
			minimized = true,
			sticky = false,
			width = awful.screen.focused().workarea.width * 0.7,
			height = awful.screen.focused().workarea.height * 0.75
		},
		callback = function(c)
			awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
			gears.timer.delayed_call(function()
				c.urgent = false
			end)
		end
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" }
	}, properties = { titlebars_enabled = true }
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- hacky way to determine if it was a double click
local double_click_timer = nil
local function is_double_click()
	if double_click_timer then
		double_click_timer:stop()
		double_click_timer = nil
		return true
	end

	double_click_timer = gears.timer.start_new(0.20, function()
		double_click_timer = nil
		return false
	end)
end

-- Create titlebar
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = awful.util.table.join(
		awful.button({}, 1, function()
			if is_double_click() then
				c.maximized = not c.maximized
				c:raise()
			else
				awful.mouse.client.move(c)
			end
		end),
		awful.button({}, 2, function()
			c:kill()
		end),
		awful.button({}, 3, function()
			client.focus = c
			c:raise()
			awful.mouse.client.resize(c)
		end)
	)

	-- Widgets that are aligned to the left
	local left_layout = wibox.widget {
		layout = wibox.layout.fixed.horizontal,
		spacing = 5,
		awful.titlebar.widget.closebutton(c),
		awful.titlebar.widget.maximizedbutton(c),
		awful.titlebar.widget.minimizebutton(c),
	}

	-- The title goes in the middle
	local middle_layout = wibox.layout.flex.horizontal()
	local title = awful.titlebar.widget.titlewidget(c)
	title:set_align("center")
	middle_layout:add(title)
	middle_layout:buttons(buttons)

	-- Widgets that are aligned to the right
	local right_layout = wibox.widget {
		layout = wibox.layout.fixed.horizontal,
		spacing = 5,
		awful.titlebar.widget.floatingbutton(c),
		awful.titlebar.widget.stickybutton(c),
		awful.titlebar.widget.ontopbutton(c),
	}

	-- Now bring it all together
	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(middle_layout)
	layout:set_right(right_layout)

	local margin_layout = wibox.container.margin(layout, 5, 5, 5, 5)

	awful.titlebar(c, { size = 24 }):set_widget(margin_layout)
end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
-- 	c:emit_signal("request::activate", "mouse_enter", { raise = false })
-- end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- GAPS
beautiful.systray_icon_spacing = 5

-- AUTO-EXEC
awful.spawn.with_shell("light-locker --lock-after-screensaver=5 --lock-on-suspend --lock-on-lid --idle-hint")
awful.spawn.with_shell("picom --experimental-backends")
awful.spawn.with_shell("$HOME/.fehbg")
awful.spawn.with_shell("flameshot")
-- awful.spawn.with_shell("caffeine-indicator")
awful.spawn.with_shell("setxkbmap -option caps:escape")
awful.spawn("pcmanfm -d") -- TODO: figure out how to start the daemon with spawning a window
awful.spawn.with_shell("~/.config/awesome/tmux_scratch.sh") -- uncomment if not using tmux-continuum
awful.spawn.with_shell("autorandr --change")

-- rounded corners for all windows
client.connect_signal("manage", function(c)
	c.shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 8)
	end
end)

-- make the garbage collector collect more often
collectgarbage("setpause", 160)
collectgarbage("setstepmul", 400)

gears.timer.start_new(10, function()
	collectgarbage("step", 20000)
	return true
end)
