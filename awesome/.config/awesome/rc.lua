-- TODO:
--	- in general: CLEAN THIS UP
--		- THIS IS EMBARASSING
--	- deconstruct this rc into multiple files
--	- build a widget with options for choosing kb layout

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

-- Bootstrap library
require("bootstrap.bootstrap")

-- widgets
-- https://github.com/streetturtle/awesome-wm-widgets
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local separator = wibox.widget({
  widget = wibox.widget.separator,
  orientation = "vertical",
  forced_width = 13,
  color = "#504945",
})

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
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then
      return
    end
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
  awful.layout.suit.fair,
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
  {
    "Hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "Manual", terminal .. " -e man awesome" },
  {
    "Adjust screens",
    function()
      awful.spawn.with_shell("autorandr --change")
    end,
  },
  { "Restart", awesome.restart },
}

mypoweroptsmenu = {
  {
    "Logout",
    function()
      awesome.quit()
    end,
  },
  {
    "Lock",
    function()
      awful.spawn.with_shell("xautolock -locknow")
    end,
  },
  {
    "Reboot",
    function()
      awful.spawn.with_shell("reboot")
    end,
  },
  {
    "Suspend",
    function()
      awful.spawn.with_shell("systemctl suspend")
    end,
  },
  {
    "Shutdown",
    function()
      awful.spawn.with_shell("shutdown now")
    end,
  },
}

local minimized_entry = function(c)
  text = "Minimize"
  if c.minimized then
    text = "Un-minimize"
    icon = beautiful.titlebar_close_button_focus_press
  end
  return {
    text,
    function()
      c.minimized = not c.minimized
    end,
    beautiful.titlebar_minimize_button_focus_press,
  }
end

local maximized_entry = function(c)
  text = "Maximize"
  icon = beautiful.titlebar_maximized_button_focus_inactive_hover
  if c.maximized then
    text = "Un-maximize"
    icon = beautiful.titlebar_maximized_button_focus_active_hover
  end
  return {
    text,
    function()
      c.maximized = not c.maximized
      c:raise()
    end,
    icon,
  }
end

local floating_entry = function(c)
  icon = beautiful.titlebar_floating_button_focus_inactive_hover
  if c.floating then
    icon = beautiful.titlebar_floating_button_focus_active_hover
  end
  return {
    "Floating",
    function()
      c.floating = not c.floating
      c:raise()
    end,
    icon,
  }
end

local sticky_entry = function(c)
  icon = beautiful.titlebar_sticky_button_focus_inactive_hover
  if c.sticky then
    icon = beautiful.titlebar_sticky_button_focus_active_hover
  end
  return {
    "Sticky",
    function()
      c.sticky = not c.sticky
      c:raise()
    end,
    icon,
  }
end

local ontop_entry = function(c)
  icon = beautiful.titlebar_ontop_button_focus_inactive_hover
  if c.ontop then
    icon = beautiful.titlebar_ontop_button_focus_active_hover
  end
  return {
    "Ontop",
    function()
      c.ontop = not c.ontop
      c:raise()
    end,
    icon,
  }
end

local myclientmenu = function(c)
  local menu = awful.menu({
    items = {
      {
        "Close",
        function()
          c:kill()
        end,
        beautiful.titlebar_close_button_focus_press,
      },
      minimized_entry(c),
      maximized_entry(c),
      {
        "Fullscreen",
        function()
          c.fullscreen = not c.fullscreen
          c:raise()
        end,
      },
      floating_entry(c),
      sticky_entry(c),
      ontop_entry(c),
    },
  })

  -- TODO: get this to work
  menu:connect_signal("mouse::leave", function()
    naughty.destroy(menu)
    menu = nil
  end)

  return menu
end

-- Load Debian menu entries
local has_debian, debian = pcall(require, "debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

local menu_awesome = { "Awesome", myawesomemenu, beautiful.awesome_icon }
local menu_poweropts = { "Leave", mypoweroptsmenu } -- TODO: get some icon

if has_fdo then
  mymainmenu = freedesktop.menu.build({
    before = {},
    after = {
      menu_awesome,
      menu_poweropts,
    },
  })
else
  mymainmenu = awful.menu({
    items = {
      menu_awesome,
      -- { "programs", debian.menu.Debian_menu.Debian },
      menu_poweropts,
    },
  })
end

mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu,
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
mytextclock = wibox.widget.textclock("%a %d %b %Y %T", 1)
local cw = calendar_widget({
  -- TODO: look into setting week numbers here
  placement = "top_right",
})
mytextclock:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then
    cw.toggle()
  end
end)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),
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
  awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
  end),
  awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal("request::activate", "tasklist", { raise = true })
    end
  end),
  awful.button({}, 2, function(c)
    c:kill()
  end),
  awful.button({}, 3, function(c)
    clientmenu = myclientmenu(c)
    awful.menu.toggle(clientmenu)
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)

awful.screen.connect_for_each_screen(function(s)
  -- Each screen has its own tag table.
  awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 3, function()
      awful.layout.inc(-1)
    end),
    awful.button({}, 4, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 5, function()
      awful.layout.inc(-1)
    end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.noempty,
    buttons = taglist_buttons,
    layout = {
      layout = wibox.layout.fixed.horizontal,
      spacing_widget = separator,
      spacing = 1,
    },
  })

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    style = {
      shape = gears.shape.rectangle,
      shape_border_width = 1,
      shape_border_color = beautiful.border_normal,
      shape_border_width_focus = 1,
      shape_border_color_focus = beautiful.border_normal,
    },
    layout = {
      layout = wibox.layout.flex.horizontal,
    },
  })

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })

  -- Add widgets to the wibox
  s.mywibox:setup({
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
      separator,
      wibox.widget.systray(true),
      -- separator,
      -- media_widget({}),
      -- require("player"),
      -- separator,
      -- awful.widget.watch("ifstat -t 1", 1, function(widget, stdout)
      -- 	awful.spawn.easy_async("ifstat -t 1", function(stdout)
      -- 		local upload, download = stdout:match("([^%s]+)%s+([^%s]+)")
      --
      -- 		widget.text = "  " .. upload .. ",    " .. download
      -- 	end)
      -- end, network_widget),
      separator,
      awful.widget.watch([[weather.sh]], 60), -- weather
      separator,
      wibox.widget.textbox(" "),
      awful.widget.watch([[cpu_temp.sh]], 1), -- CPU temp
      -- require("widgets.weather").weatherwidget,
      -- wibox.widget({
      -- 	widget = wibox.widget.textbox,
      -- 	text = "test",
      -- }),
      separator,
      wibox.widget.textbox("  "),
      awful.widget.watch([[cpu_usage.sh]], 1), -- CPU usage
      separator,
      wibox.widget.textbox("󰍛 "),
      awful.widget.watch([[memory_usage.sh]], 1), -- RAM usage
      -- separator,
      -- volume_widget({
      -- 	device = "default",
      -- 	widget_type = "icon_and_text",
      -- 	icon_dir = "/usr/share/icons/Papirus-Dark/symbolic/status/",
      -- }),
      separator,
      wibox.widget.textbox("󰌓 "),
      awful.widget.keyboardlayout(),
      separator,
      battery_widget({
        path_to_icons = "/usr/share/icons/Papirus-Dark/symbolic/status/",
        display_notification = true,
        warning_msg_title = "Low battery",
        warning_msg_text = "Please charge battery",
        warning_msg_position = "top_right",
      }),
      separator,
      wibox.widget.textbox("  "),
      mytextclock,
      separator,
      s.mylayoutbox,
    },
  })
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(awful.button({}, 3, function()
  mymainmenu:toggle()
end)))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

  -- focus window
  awful.key({ modkey }, "h", function()
    awful.client.focus.global_bydirection("left")
  end, { description = "focus window to the left", group = "client" }),
  awful.key({ modkey }, "j", function()
    awful.client.focus.global_bydirection("down")
  end, { description = "focus window below", group = "client" }),
  awful.key({ modkey }, "k", function()
    awful.client.focus.global_bydirection("up")
  end, { description = "focus window above", group = "client" }),
  awful.key({ modkey }, "l", function()
    awful.client.focus.global_bydirection("right")
  end, { description = "focus window to the right", group = "client" }),

  -- swap window
  awful.key({ modkey, "Shift" }, "h", function()
    awful.client.swap.global_bydirection("left")
  end, { description = "swap with window to the left", group = "client" }),
  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.global_bydirection("down")
  end, { description = "swap with window below", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.global_bydirection("up")
  end, { description = "swap with window above", group = "client" }),
  awful.key({ modkey, "Shift" }, "l", function()
    awful.client.swap.global_bydirection("right")
  end, { description = "swap with window to the right", group = "client" }),

  -- resize window
  awful.key({ modkey, altkey }, "h", function()
    awful.tag.incmwfact(-0.01)
  end, { description = "move left window border left", group = "client" }),
  awful.key({ modkey, altkey }, "j", function()
    awful.client.incwfact(-0.05)
  end, { description = "move bottom window border down", group = "client" }),
  awful.key({ modkey, altkey }, "k", function()
    awful.client.incwfact(0.05)
  end, { description = "move top window border up", group = "client" }),
  awful.key({ modkey, altkey }, "l", function()
    awful.tag.incmwfact(0.01)
  end, { description = "move right window border right", group = "client" }),

  -- focus screen
  awful.key({ modkey, "Control" }, "h", function()
    awful.screen.focus_bydirection("left")
  end, { description = "focus window to the left", group = "client" }),
  awful.key({ modkey, "Control" }, "j", function()
    awful.screen.focus_bydirection("down")
  end, { description = "focus window below", group = "client" }),
  awful.key({ modkey, "Control" }, "k", function()
    awful.screen.focus_bydirection("up")
  end, { description = "focus window above", group = "client" }),
  awful.key({ modkey, "Control" }, "l", function()
    awful.screen.focus_bydirection("right")
  end, { description = "focus window to the right", group = "client" }),

  -- page through tags
  awful.key({ modkey }, "Tab", function()
    awful.tag.viewnext()
  end, { description = "focus next tag", group = "tags" }),
  awful.key({ modkey, "Shift" }, "Tab", function()
    awful.tag.viewprev()
  end, { description = "focus previous tag", group = "tags" }),

  -- restart awesome
  awful.key({ modkey, "Control" }, "r", function()
    awesome.restart()
    os.cmd("notify-send 'Reloaded awesome' -i 'system-reboot'")
  end, { description = "reload awesome", group = "awesome" }),

  -- exit awesome
  awful.key({ modkey, "Shift" }, "x", function()
    awesome.quit()
  end, { description = "reload awesome", group = "awesome" }),

  -- scratchpads
  -- TODO: find out how to make tmux script work
  awful.key({ modkey }, "p", function()
    scratch.toggle(
      terminal_secondary .. " --class scratch-main -t scratch-main -e tmux a -t scratchpad; select-window -t main",
      { instance = "scratch-main" },
      true
    )
  end, { description = "open scratch terminal", group = "kirk" }),
  awful.key({ modkey }, "c", function()
    scratch.toggle(
      terminal_secondary .. " --class scratch-py -t scratch-py -e tmux a -t scratchpad; select-window -t calculator",
      { instance = "scratch-py" },
      true
    )
  end, { description = "open calculator", group = "kirk" }),

  awful.key({ modkey, altkey }, "Tab", function()
    awful.client.focus.byidx(1)
  end, { description = "next window", group = "client" }),

  awful.key({ modkey, altkey, "Shift" }, "Tab", function()
    awful.client.focus.byidx(-1)
  end, { description = "previous window", group = "client" })
)

clientkeys = gears.table.join(
  awful.key({ modkey, "Shift" }, "q", function(c)
    c:kill()
  end, { description = "close", group = "client" }),
  awful.key({ modkey, "Control" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, { description = "move to master", group = "client" }),
  awful.key({ modkey, "Shift" }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = "toggle fullscreen", group = "client" }),
  awful.key({ modkey }, "f", function(c)
    c.floating = not c.floating
    c:raise()
  end, { description = "toggle floating", group = "client" }),
  awful.key({ modkey }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = "toggle maximize", group = "client" }),
  awful.key({ modkey }, "s", function(c)
    c.sticky = not c.sticky
  end, { description = "toggle sticky", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(
    globalkeys,

    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = "view tag #" .. i, group = "tag" }),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = "toggle tag #" .. i, group = "tag" }),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = "move focused client to tag #" .. i, group = "tag" }),

    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = "toggle focused client on tag #" .. i, group = "tag" })
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

local global_props = {
  border_color = beautiful.border_normal,
  border_width = beautiful.border_width,
  buttons = clientbuttons,
  focus = awful.client.focus.filter,
  keys = clientkeys,
  placement = awful.placement.no_overlap + awful.placement.no_offscreen,
  raise = true,
  screen = awful.screen.preferred,
  titlebars_enabled = false,
}

awful.rules.rules = {
  { -- all clients will match this rule
    rule = {},
    properties = global_props,
  },
  { -- webcam rules
    rule_any = {
      name = {
        "Webcam",
      },
    },
    properties = {
      buttons = clientbuttons,
      keys = clientkeys,
      screen = awful.screen.preferred, -- maybe on primary
      width = awful.screen.focused().workarea.width * 0.2,
      height = awful.screen.focused().workarea.height * 0.2,
      focus = awful.client.focus.filter, -- what is this?
      raise = true,
      ontop = true,
      floating = true,
      titlebars_enabled = false,
      border_width = 0,
      border_color = "#000000",
      placement = awful.placement.bottom_right,

      -- border_color = beautiful.border_normal,
      -- border_width = beautiful.border_width,
      -- placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      -- titlebars_enabled = true,
    },
  },
  { -- floating without titlebar
    rule_any = {
      name = {
        "Lock Screen — 1Password",
        "Sign in to Steam",
        "splash",
        "XiaoMiTool V2",
      },
    },
    properties = {
      table.unpack(global_props),
      floating = true,
      placement = awful.placement.centered,
      titlebars_enabled = false,
      border_width = 0,
      ontop = true,
    },
  },
  { -- floating with titlebar
    rule_any = {
      type = { "dialog" },
      instance = {
        "copyq", -- Includes session name in class.
        "pinentry",
        "scratch-main",
        "scratch-py",
        "com-atlauncher-App",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Dragon-drop",
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Discord Updater",
        "Zoom Cloud Meetings",
        "zoom",
        -- "Obsidian",
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = {
      table.unpack(global_props),
      floating = true,
      placement = awful.placement.centered,
    },
  },
  { -- scratch terminal
    rule_any = {
      instance = { "scratch-main" },
      class = { "scratch-main" },
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
    callback = function(c)
      awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
      gears.timer.delayed_call(function()
        c.urgent = false
      end)
    end,
  },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- -- Add new window to bottom of stack
  -- if not awesome.startup then
  --   awful.client.setslave(c)
  -- end

  -- -- round corners
  -- c.shape = function(cr, w, h)
  --   gears.shape.rounded_rect(cr, w, h, 9)
  -- end

  -- Prevent clients from being unreachable after screen count changes.
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
end)

-- Signal handler for property::floating
client.connect_signal("property::floating", function(c)
  if c.floating and not c.fullscreen and not c.maximized then
    c.shape = function(cr, width, height)
      local corner_radius = 9
      gears.shape.rounded_rect(cr, width, height, corner_radius)
    end
  else
    c.shape = nil
  end
end)

-- automatically jump to tag with urgent window
client.connect_signal("property::urgent", function(c)
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

  double_click_timer = gears.timer.start_new(0.20, function()
    double_click_timer = nil
    return false
  end)
end

-- Create titlebar
client.connect_signal("request::titlebars", function(c)
  -- Widgets that are aligned to the left
  local left_layout = wibox.widget({
    layout = wibox.layout.fixed.horizontal,
    spacing = 5,
    awful.titlebar.widget.closebutton(c),
    awful.titlebar.widget.minimizebutton(c),
    awful.titlebar.widget.maximizedbutton(c),
  })

  -- buttons for the titlebar
  local middle_buttons = awful.util.table.join(
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

  -- The title goes in the middle
  local middle_container = wibox.container.place(wibox.widget({
    layout = wibox.layout.fixed.horizontal,
    spacing = 8,
    mode = "center",
    awful.titlebar.widget.iconwidget(c),
    awful.titlebar.widget.titlewidget(c),
  }))

  local middle_layout = wibox.layout.flex.horizontal()
  middle_layout:add(middle_container)
  middle_layout:buttons(middle_buttons)

  -- Widgets that are aligned to the right
  local right_layout = wibox.widget({
    layout = wibox.layout.fixed.horizontal,
    spacing = 5,
    awful.titlebar.widget.floatingbutton(c),
    awful.titlebar.widget.stickybutton(c),
    awful.titlebar.widget.ontopbutton(c),
  })

  -- Now bring it all together
  local layout = wibox.layout.align.horizontal()
  layout:set_left(left_layout)
  layout:set_middle(middle_layout)
  layout:set_right(right_layout)

  local margin_layout = wibox.container.margin(layout, 2, 2, 1, 1)
  local max_titlebar_height = 19
  local min_titlebar_height = 10
  local titlebar_height = math.floor(screen.primary.workarea.height * 0.024)
  if titlebar_height > max_titlebar_height then
    titlebar_height = max_titlebar_height
  elseif titlebar_height < min_titlebar_height then
    titlebar_height = max_titlebar_height
  end

  awful.titlebar(c, { size = titlebar_height }):set_widget(margin_layout)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

-- set focus border
client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)

-- set normal border
client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)
-- }}}

screen.connect_signal("arrange", function(s)
  local layout = s.selected_tag.layout.name
  local is_single_client = #s.clients == 1
  for _, c in pairs(s.clients) do
    -- hide border if:
    --   - single_client
    --   - fullscreen
    --   - maximized
    local border_width = beautiful.border_width
    if layout == "max" or is_single_client or c.fullscreen or c.maximized then
      border_width = 0
    end
    c.border_width = border_width

    -- shadows only on floating windows
    local has_shadow = 0
    if layout == "floating" or c.floating and not c.fullscreen and not c.maximized then
      has_shadow = 1
    end
    awful.spawn("xprop -id " .. c.window .. " -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW " .. has_shadow, false)
  end
end)

-- GAPS
beautiful.systray_icon_spacing = 5
--
-- set focus to primary screen
awful.screen.focus(screen.primary)

-- AUTO-EXEC
awful.spawn.with_shell("~/.fehbg")
awful.spawn.with_shell("~/.config/awesome/tmux_scratch.sh")

-- Autorun programs
local autorun = true
local autorunApps = {
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

-- make the garbage collector collect more often
collectgarbage("setpause", 160)
collectgarbage("setstepmul", 400)

gears.timer.start_new(10, function()
  collectgarbage("step", 20000)
  return true
end)
