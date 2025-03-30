# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# some code taken from:
#   - https://github.com/stefur/qtile-config

import os
import subprocess
from enum import Enum

from colors import colors

from libqtile import hook, layout, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

is_wayland = qtile.core.name == "wayland"

MOD = "mod4"
ALT = "mod1"

QTILE_DIR = os.path.expandvars("${XDG_CONFIG_HOME}/qtile")


def move_window_to_screen(qtile, window, screen):
    """Moves a window to a screen and focuses it, allowing you to move it
    further if you wish."""
    window.togroup(screen.group.name)
    qtile.focus_screen(screen.index)
    screen.group.focus(window, True)


@lazy.function
def move_window_to_prev_screen(qtile):
    """Moves a window to the previous screen. Loops around the beginning and
    end."""
    index = qtile.current_screen.index
    index = index - 1 if index > 0 else len(qtile.screens) - 1
    move_window_to_screen(qtile, qtile.current_window, qtile.screens[index])


@lazy.function
def move_window_to_next_screen(qtile):
    """Moves a window to the next screen. Loops around the beginning and
    end."""
    index = qtile.current_screen.index
    index = index + 1 if index < len(qtile.screens) - 1 else 0
    move_window_to_screen(qtile, qtile.current_window, qtile.screens[index])


@hook.subscribe.startup
def autostart():
    autostart_cmd = os.path.expanduser(f"{QTILE_DIR}/autostart.sh")
    subprocess.Popen([autostart_cmd])
    qtile.hide_show_bar("all", "all")


@hook.subscribe.startup_once
def autostart_once():
    autostart_once_cmd = os.path.expanduser(f"{QTILE_DIR}/autostart_once.sh")
    subprocess.Popen([autostart_once_cmd])


keys = [
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "j", lazy.layout.next(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.previous(), desc="Move focus up"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD, "shift"], "h", lazy.layout.shrink_main(), desc="Grow window left"),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([MOD, "shift"], "l", lazy.layout.grow_main(), desc="Grow window right"),
    Key([MOD], "m", lazy.next_screen(), desc="Next screen"),
    Key([MOD], "comma", lazy.prev_screen(), desc="Prev screen"),
    Key(
        [MOD, "shift"],
        "m",
        move_window_to_next_screen,
        desc="Move window to next screen",
    ),
    Key(
        [MOD, "shift"],
        "comma",
        move_window_to_prev_screen,
        desc="Move window to prev screen",
    ),
    Key([MOD], "Tab", lazy.screen.next_group(), desc="Next group"),
    Key([MOD, "shift"], "Tab", lazy.screen.prev_group(), desc="Prev group"),
    Key([MOD, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "shift"], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([MOD], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "shift"], "x", lazy.shutdown(), desc="Shutdown Qtile"),
]

# wayland keys
if is_wayland:
    from libqtile.backend.wayland.inputs import InputConfig

    @hook.subscribe.focus_change
    @hook.subscribe.client_killed
    @hook.subscribe.client_managed
    def update_waybar(*_args) -> None:
        """Update waybar with open groups and windows"""
        subprocess.Popen(["qtile-groups.py"])

    keys.extend(
        [
            # search
            Key([MOD], "space", lazy.spawn("search.sh"), desc="Search"),
            Key(
                [MOD, "control"],
                "space",
                lazy.spawn("emoji_picker.sh"),
                desc="Emoji picker",
            ),
            # terminals
            Key(
                [MOD],
                "Return",
                lazy.spawn(os.environ["TERMINAL"]),
                desc="Spawn terminal",
            ),
            Key(
                [MOD, "shift"],
                "Return",
                lazy.spawn(os.environ["TERMINAL_SECONDARY"]),
                desc="Spawn alternative terminal",
            ),
            # file managers
            Key(
                [
                    MOD,
                ],
                "e",
                lazy.spawn(f'{os.environ["TERMINAL"]} -e "yazi"'),
                desc="Spawn TUI file manager",
            ),
            Key(
                [MOD, "shift"],
                "e",
                lazy.spawn(os.environ["FILEMANAGER"]),
                desc="Spawn file manager",
            ),
            # browsers
            Key([MOD], "w", lazy.spawn(os.environ["BROWSER"]), desc="Spawn browser"),
            Key(
                [MOD, "shift"],
                "w",
                lazy.spawn(os.environ["BROWSER_SECONDARY"]),
                desc="Spawn alternative browser",
            ),
            # notes
            Key([MOD], "n", lazy.spawn("notes.sh edit"), desc="Take notes"),
            Key(
                [MOD, "shift"],
                "n",
                lazy.spawn("notes.sh view"),
                desc="View notes",
            ),
            # screenshot
            Key([], "Print", lazy.spawn("screenshot.sh gui"), desc="Take screenshot"),
            Key(
                ["shift"],
                "Print",
                lazy.spawn("screenshot.sh fullscreen"),
                desc="Take full screenshot",
            ),
            # lock
            Key(
                [MOD, "control"],
                "q",
                lazy.spawn("lock.sh"),
                desc="Lock",
            ),
            # change keyboard layout
            Key(
                [MOD, "shift"],
                "a",
                lazy.spawn('set_keymap.sh "us(altgr-intl)"'),
                desc="US kb layout",
            ),
            Key(
                [MOD, "shift"],
                "s",
                lazy.spawn("set_keymap.sh se"),
                desc="Swedish kb layout",
            ),
            Key(
                [MOD, "shift"],
                "g",
                lazy.spawn("set_keymap.sh no"),
                desc="Norwegian kb layout",
            ),
            Key(
                [MOD, "shift"],
                "d",
                lazy.spawn("set_keymap.sh prog-qwerty"),
                desc="Programming kb layout",
            ),
            # brightness
            Key(
                [],
                "XF86MonBrightnessDown",
                lazy.spawn("change_brightness.sh lower"),
                desc="Lower brightness",
            ),
            Key(
                [],
                "XF86MonBrightnessUp",
                lazy.spawn("change_brightness.sh raise"),
                desc="Raise brightness",
            ),
            # media keys
            Key(
                [],
                "XF86AudioLowerVolume",
                lazy.spawn("change_vol.sh lower"),
                desc="Lower volume",
            ),
            Key(
                [],
                "XF86AudioRaiseVolume",
                lazy.spawn("change_vol.sh raise"),
                desc="Raise volume",
            ),
            Key(
                [],
                "XF86AudioMute",
                lazy.spawn("change_vol.sh toggle-mute"),
                desc="Mute volume",
            ),
            Key(
                [],
                "XF86AudioMicMute",
                lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
                desc="Mute mic",
            ),
            Key(
                [],
                "XF86AudioPlay",
                lazy.spawn("playerctl play-pause"),
                desc="Play/pause audio",
            ),
            Key(
                [],
                "XF86AudioPause",
                lazy.spawn("playerctl play-pause"),
                desc="Play/pause audio",
            ),
            Key(
                [],
                "XF86AudioStop",
                lazy.spawn("playerctl stop"),
                desc="Stop audio",
            ),
            Key(
                [],
                "XF86AudioPrev",
                lazy.spawn("playerctl previous"),
                desc="Previous track",
            ),
            Key(
                [],
                "XF86AudioNext",
                lazy.spawn("playerctl next"),
                desc="Next track",
            ),
            Key(
                [],
                "XF86AudioRewind",
                lazy.spawn("playerctl position 5-"),
                desc="Rewind",
            ),
            Key(
                [],
                "XF86AudioForward",
                lazy.spawn("playerctl position 5+"),
                desc="Fast-forward",
            ),
            Key(
                [],
                "XF86WLAN",
                lazy.spawn("wifi toggle"),
                desc="Toggle wifi",
            ),
            Key(
                [],
                "XF86Bluetooth",
                lazy.spawn("bluetooth toggle"),
                desc="Toggle bluetooth",
            ),
            Key(
                [],
                "XF86Mail",
                lazy.spawn("thunderbird"),
                desc="Email",
            ),
        ]
    )

    wl_input_rules = {
        "type:keyboard": InputConfig(
            kb_layout="no,se,us(altgr-intl),prog-qwerty",
            kb_repeat_delay=200,
            kb_repeat_rate=30,
            kb_variant=",nodeadkeys",
        ),
        "type:touchpad": InputConfig(
            accel_profile="flat",
            click_method="clickfinger",
            drag=False,
            dwt=False,
            middle_emulation=True,
            natural_scroll=True,
            pointer_accel=0,
            scroll_method="two_finger",
            tap=True,
        ),
        "type:pointer": InputConfig(
            accel_profile="flat",
            middle_emulation=True,
            natural_scroll=True,
            pointer_accel=0,
        ),
        "*-Kensington_Orbit_Fusion_Wireless_Trackball": InputConfig(
            pointer_accel=0.4,
            scroll_button="BTN_MIDDLE",
            scroll_method="on_button_down",
        ),
        "*-Getech_HUGE_TrackBall": InputConfig(
            pointer_accel=0.4,
            scroll_button="BTN_TASK",
            scroll_method="on_button_down",
        ),
    }

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", ALT],
            f"f{vt}",
            lazy.core.change_vt(vt).when(is_wayland),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [MOD],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = move focused window to group
            Key(
                [MOD, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc=f"Move focused window to group {i.name}",
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        border_focus="#fabd2f",
        border_normal="#655c54",
        border_width=4,
        new_client_position="top",
        single_border_width=2,
    ),
    # layout.Floating(),
]

screens = [Screen()]

# Drag floating layouts.
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus="#fabd2f",
    border_normal="#1d2021",
    border_width=4,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
