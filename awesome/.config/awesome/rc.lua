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
local has_debian, debian = pcall(require, "debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- Bootstrap library
require("bootstrap.bootstrap")

-- widgets
-- https://github.com/streetturtle/awesome-wm-widgets
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local pacman_widget = require("awesome-wm-widgets.pacman-widget.pacman")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local separator = wibox.widget {
	widget = wibox.widget.separator,
	orientation = "vertical",
	forced_width = 13,
	color = "#353535",
}

-- scratchpad terminal
-- TODO: convert this to just a hidden window running tmux so it is much faster
-- https://github.com/notnew/awesome-scratch
local scratch = require("awesome-scratch.scratch")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- THEME
beautiful.init("~/.config/awesome/themes/gruvbox/theme.lua")
beautiful.icon_theme = "Papirus-Dark"

-- DEFAULT EDITOR
local terminal = "wezterm"
local terminal_secondary = "alacritty"
local browser = "firefox"
local file_manager = "pcmanfm"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- MOD KEY
modkey = "Mod4"
altkey = "Mod1"

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
	{ "hotkeys",
		function ()
			hotkeys_popup.show_help(nil,
				awful.screen.focused())
		end, },
	{ "manual",      terminal .. " -e man awesome", },
	{ "edit config", editor_cmd .. " " .. awesome.conffile, },
	{ "restart",     awesome.restart, },
}

mypoweroptsmenu = {
	{ "log out",  function () awesome.quit() end, },
	{ "lock",     function () awful.spawn.with_shell("light-locker-command -l") end, },
	{ "reboot",   function () awful.spawn.with_shell("reboot") end, },
	{ "suspend",  function () awful.spawn.with_shell("systemctl suspend") end, },
	{ "poweroff", function () awful.spawn.with_shell("shutdown now") end, },

}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon, }
local menu_terminal = { "open terminal", terminal, }
local menu_poweropts = { "leave", mypoweroptsmenu, }

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome, },
		after = {
			menu_poweropts,
			menu_terminal,
		},
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			-- { "programs", debian.menu.Debian_menu.Debian },
			menu_terminal,
			menu_poweropts,
		},
	})
end

mylauncher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = mymainmenu,
})

-- Menubar configuration
menubar.utils.terminal =
	terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock("%a %d %b %Y  %T", 1)
local cw = calendar_widget({
	placement = "top_right",
})
mytextclock:connect_signal("button::press",
	function (_, _, _, button)
		if button == 1 then cw.toggle() end
	end)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function (t) t:view_only() end),
	awful.button({ modkey, }, 1, function (t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey, }, 3, function (t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function (t) awful.tag.viewnext(t.screen) end),
	awful.button({}, 5, function (t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{ raise = true, }
			)
		end
	end),
	awful.button({}, 3, function ()
		awful.menu.client_list({ theme = { width = 250, }, })
	end),
	awful.button({}, 4, function ()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function ()
		awful.client.focus.byidx(-1)
	end))

awful.screen.connect_for_each_screen(function (s)
	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9", }, s,
		awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function () awful.layout.inc(1) end),
		awful.button({}, 3, function () awful.layout.inc(-1) end),
		awful.button({}, 4, function () awful.layout.inc(1) end),
		awful.button({}, 5, function () awful.layout.inc(-1) end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.noempty,
		buttons = taglist_buttons,
		style   = {
			-- shape = gears.shape.rectangle,
			-- spacing = 0,
		},
		layout  = {
			layout = wibox.layout.fixed.horizontal,
		},
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style   = {
			shape = gears.shape.rounded_bar,
			shape_border_width = 1,
			shape_border_color = beautiful.border_normal,
			shape_border_width_focus = 1,
			shape_border_color_focus = beautiful.border_focus,
		},
		layout  = {
			spacing = 0,
			max_widget_size = awful.screen.focused().workarea.width * 0.12,
			layout = wibox.layout.flex.horizontal,
		},
	}

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			separator,
			s.mytaglist,
			separator,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{
			-- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(true),
			separator,
			awful.widget.watch([[curl -s "https://wttr.in/?format=%c+%t"]], 60), -- weather
			separator,
			wibox.widget.textbox("󰌓 "),
			mykeyboardlayout,
			separator,
			wibox.widget.textbox(" "),
			awful.widget.watch(
				[[bash -c "cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000 \"°C\"}'"]],
				1), -- CPU temp
			separator,
			wibox.widget.textbox("  "),
			awful.widget.watch(
				[[bash -c "echo ""$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%""]],
				1), -- CPU usage
			separator,
			wibox.widget.textbox("󰍛 "),
			awful.widget.watch(
				[[bash -c "free -t | awk 'NR == 2 {printf(\"%.1f%\"), $3/$2*100}'"]],
				1), -- RAM usage
			separator,
			volume_widget({
				device = "default",
				widget_type = "icon_and_text",
				icon_dir = "/usr/share/icons/Papirus-Dark/symbolic/status/",
			}),
			separator,
			pacman_widget({
				polkit_agent_path =
				"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
			}),
			separator,
			battery_widget({
				path_to_icons = "/usr/share/icons/Papirus-Dark/symbolic/status/",
				display_notification = true,
				warning_msg_title = "Low battery",
				warning_msg_text = "Please charge battery",
				warning_msg_position = "top_right",
			}),
			separator,
			-- wibox.widget.textbox('  '),
			mytextclock,
			separator,
			s.mylayoutbox,
		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function () mymainmenu:toggle() end)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

-- focus window
	awful.key({ modkey, }, "h",
		function () awful.client.focus.global_bydirection("left") end,
		{ description = "focus window to the left", group = "client", }),
	awful.key({ modkey, }, "j",
		function () awful.client.focus.global_bydirection("down") end,
		{ description = "focus window below", group = "client", }),
	awful.key({ modkey, }, "k",
		function () awful.client.focus.global_bydirection("up") end,
		{ description = "focus window above", group = "client", }),
	awful.key({ modkey, }, "l",
		function () awful.client.focus.global_bydirection("right") end,
		{ description = "focus window to the right", group = "client", }),

	-- swap window
	awful.key({ modkey, "Shift", }, "h",
		function () awful.client.swap.global_bydirection("left") end,
		{ description = "swap with window to the left", group = "client", }),
	awful.key({ modkey, "Shift", }, "j",
		function () awful.client.swap.global_bydirection("down") end,
		{ description = "swap with window below", group = "client", }),
	awful.key({ modkey, "Shift", }, "k",
		function () awful.client.swap.global_bydirection("up") end,
		{ description = "swap with window above", group = "client", }),
	awful.key({ modkey, "Shift", }, "l",
		function () awful.client.swap.global_bydirection("right") end,
		{ description = "swap with window to the right", group = "client", }),

	-- resize window
	awful.key({ modkey, altkey, }, "h",
		function () awful.tag.incmwfact(-0.01) end,
		{ description = "move left window border left", group = "client", }),
	awful.key({ modkey, altkey, }, "j",
		function () awful.client.incwfact(-0.05) end,
		{ description = "move bottom window border down", group = "client", }),
	awful.key({ modkey, altkey, }, "k",
		function () awful.client.incwfact(0.05) end,
		{ description = "move top window border up", group = "client", }),
	awful.key({ modkey, altkey, }, "l", function () awful.tag.incmwfact(0.01) end,
		{ description = "move right window border right", group = "client", }),

	-- focus screen
	awful.key({ modkey, "Control", }, "h",
		function () awful.screen.focus_bydirection("left") end,
		{ description = "focus window to the left", group = "client", }),
	awful.key({ modkey, "Control", }, "j",
		function () awful.screen.focus_bydirection("down") end,
		{ description = "focus window below", group = "client", }),
	awful.key({ modkey, "Control", }, "k",
		function () awful.screen.focus_bydirection("up") end,
		{ description = "focus window above", group = "client", }),
	awful.key({ modkey, "Control", }, "l",
		function () awful.screen.focus_bydirection("right") end,
		{ description = "focus window to the right", group = "client", }),

	-- page through tags
	awful.key({ modkey, }, "Tab", function () awful.tag.viewnext() end,
		{ description = "focus next tag", group = "tags", }),
	awful.key({ modkey, "Shift", }, "Tab", function () awful.tag.viewprev() end,
		{ description = "focus previous tag", group = "tags", }),


	-- restart awesome
	awful.key({ modkey, "Control", }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome", }),

	-- scratchpads
	-- TODO: find out how to make tmux script work
	awful.key({ modkey, }, "p",
		function ()
			scratch.toggle(terminal_secondary ..
				" --class scratch-main -t scratch-main -e tmux a -t scratchpad; select-window -t main"
				, { instance = "scratch-main", }, true)
		end,
		{ description = "open scratch terminal", group = "kirk", }),
	awful.key({ modkey, }, "c",
		function ()
			scratch.toggle(terminal_secondary ..
				" --class scratch-py -t scratch-py -e tmux a -t scratchpad; select-window -t calculator"
				, { instance = "scratch-py", }, true)
		end,
		{ description = "open calculator", group = "kirk", })

)

clientkeys = gears.table.join(
	awful.key({ modkey, }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ description = "toggle fullscreen", group = "client", }),
	awful.key({ modkey, }, "q", function (c) c:kill() end,
		{ description = "close", group = "client", }),
	awful.key({ modkey, "Control", }, "space", awful.client.floating.toggle,
		{ description = "toggle floating", group = "client", }),
	awful.key({ modkey, "Control", }, "Return",
		function (c) c:swap(awful.client.getmaster()) end,
		{ description = "move to master", group = "client", }),
	awful.key({ modkey, }, "s", function (c) c.sticky = not c.sticky end,
		{ description = "toggle keep on top", group = "client", }),
	awful.key({ modkey, }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{ description = "(un)maximize", group = "client", })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,

		-- View tag only.
		awful.key({ modkey, }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{ description = "view tag #" .. i, group = "tag", }),

		-- Toggle tag display.
		awful.key({ modkey, "Control", }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{ description = "toggle tag #" .. i, group = "tag", }),

		-- Move client to tag.
		awful.key({ modkey, "Shift", }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{ description = "move focused client to tag #" .. i, group = "tag", }),

		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift", }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{ description = "toggle focused client on tag #" .. i, group = "tag", })
	)
end

clientbuttons = gears.table.join(

	awful.button({}, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", { raise = true, })
	end),

	awful.button({ modkey, }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", { raise = true, })
		awful.mouse.client.move(c)
	end),

	awful.button({ modkey, }, 3, function (c)
		c:emit_signal("request::activate", "mouse_click", { raise = true, })
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
			placement = awful.placement.no_overlap + awful.placement
				.no_offscreen,
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
			},
		},
		properties = {
			floating = true,
			placement = awful.placement.centered,
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
		},
	},
	{
		rule_any = {
			instance = { "scratch-main", },
			class = { "scratch-main", },
		},
		properties = {
			skip_taskbar = false,
			floating = true,
			ontop = true,
			minimized = true,
			placement = awful.placement.centered,
			sticky = true,
			width = awful.screen.focused().workarea.width * 0.7,
			height = awful.screen.focused().workarea.height * 0.75,
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
		},
		callback = function (c)
			awful.placement.centered(c,
				{ honor_padding = true, honor_workarea = true, })
			gears.timer.delayed_call(function ()
				c.urgent = false
			end)
		end,
	},

	-- TODO: remove titlebar from scratch windows
	-- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { "normal", "dialog", },
		},
		properties = { titlebars_enabled = true, },
	},

	{
		rule = {},
		except = { instance = "cairo-dock", },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			keys = clientkeys,
			buttons = clientbuttons,
		},
	},
	{
		rule = { class = "MPlayer", },
		properties = { floating = true, },
	},
	{
		rule = { instance = "cairo-dock", },
		--      type = "dock",
		properties = {
			floating = true,
			ontop = true,
			focus = false,
		},
	},

	{
		rule = { name = "cairo-dock", },
		properties = { border_width = 0, },
	},
	{
		rule = { name = "cairo-dock-sub", },
		properties = { border_width = 0, },
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	if not awesome.startup then awful.client.setslave(c) end
	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end


	-- rounded corners for all windows
	c.shape = function (cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 8)
	end
end)

-- automatically jump to tag with urgent window
client.connect_signal("property::urgent", function (c)
	c.minimized = false
	c:jump_to()
end)

-- hacky way to determine if it was a double click
local double_click_timer = nil
local function is_double_click()
	if double_click_timer then
		double_click_timer:stop()
		double_click_timer = nil
		return true
	end

	double_click_timer = gears.timer.start_new(0.20, function ()
		double_click_timer = nil
		return false
	end)
end

-- Create titlebar
client.connect_signal("request::titlebars", function (c)
	-- buttons for the titlebar
	local buttons = awful.util.table.join(
		awful.button({}, 1, function ()
			if is_double_click() then
				c.maximized = not c.maximized
				c:raise()
			else
				awful.mouse.client.move(c)
			end
		end),
		awful.button({}, 2, function ()
			c:kill()
		end),
		awful.button({}, 3, function ()
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
		awful.titlebar.widget.minimizebutton(c),
		awful.titlebar.widget.maximizedbutton(c),
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
	local titlebar_height = math.max(
		math.floor(screen.primary.workarea.height * 0.022), 24)

	awful.titlebar(c, { size = titlebar_height, }):set_widget(margin_layout)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function (c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false, })
end)

client.connect_signal("focus",
	function (c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
	function (c) c.border_color = beautiful.border_normal end)
-- }}}

-- GAPS
beautiful.systray_icon_spacing = 13


-- AUTO-EXEC
awful.spawn.with_shell("~/.fehbg")
awful.spawn.with_shell("~/.config/awesome/tmux_scratch.sh")
awful.spawn.with_shell("setxkbmap -option caps:escape")


-- Autorun programs
local autorun = true
local autorunApps =
{
	-- arch
	"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",

	-- ubuntu
	"/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1",
}
if autorun then
	for app = 1, #autorunApps do
		spawn_once(autorunApps[app])
	end
end
awful.util.spawn("killall cbatticon")
awful.util.spawn("killall volumeicon")

-- set focus to primary screen
awful.screen.focus(screen.primary)

-- make the garbage collector collect more often
collectgarbage("setpause", 160)
collectgarbage("setstepmul", 400)

gears.timer.start_new(10, function ()
	collectgarbage("step", 20000)
	return true
end)
