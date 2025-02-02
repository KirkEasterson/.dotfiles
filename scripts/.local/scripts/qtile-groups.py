#!/usr/bin/python

import sys
from enum import Enum
import traceback
import logging


class GroupState(Enum):
    EMPTY = "empty"
    OCCUPIED = "occupied"
    FOCUSED = "focused"

    def build_span(self, group: str) -> str:
        match self:
            case GroupState.FOCUSED:
                return f"""<span fgcolor='{colors["fg1"]}' bgcolor='{colors["bg3"]}' underline='single' underline_color='{colors["yellow1"]}'> {group} </span>"""
            case GroupState.OCCUPIED:
                return f"""<span fgcolor='{colors["fg4"]}' bgcolor='{colors["bg1"]}' underline='single' underline_color='{colors["yellow1"]}'> {group} </span>"""
            case _:
                return ""


colors = {
    "bg": "#282828",
    "bg0": "#282828",
    "bg0h": "#1d2021",
    "bg0s": "#32302f",
    "bg1": "#3c3836",
    "bg2": "#504945",
    "bg3": "#665c54",
    "bg4": "#7c6f64",
    "fg": "#ebdbb2",
    "fg0": "#fbf1c7",
    "fg1": "#ebdbb2",
    "fg2": "#d5c4a1",
    "fg3": "#bdae93",
    "fg4": "#a89984",
    "aqua1": "#689d6a",
    "aqua2": "#8ec07c",
    "blue1": "#458588",
    "blue2": "#83a598",
    "gray1": "#a89984",
    "gray2": "#928374",
    "green1": "#98971a",
    "green2": "#b8bb26",
    "orange1": "#d65d0e",
    "orange2": "#fe8019",
    "purple1": "#b16286",
    "purple2": "#d3869b",
    "red1": "#cc241d",
    "red2": "#fb4934",
    "yellow1": "#fabd2f",
    "yellow2": "#d79921",
}

colors.update(
    {
        "primary": colors["bg"],
        "secondary": colors["bg"],
        "background": colors["bg"],
        "text": colors["bg"],
        "urgent": colors["bg"],
    }
)


try:
    import subprocess

    from libqtile.command.client import CommandClient

    c = CommandClient()
    groups: dict[str, dict[str, any]] = c.call("get_groups")

    existing_groups: dict[str, GroupState] = {}

    for group_state, group_info in groups.items():
        if group_info["screen"] is not None:
            existing_groups[group_state] = GroupState.FOCUSED
            continue
        if len(group_info["windows"]) != 0:
            existing_groups[group_state] = GroupState.OCCUPIED

    text: str = ""

    for group_state, status in existing_groups.items():
        text += status.build_span(group_state)

    with open("/tmp/qtile-groups.txt", "w", encoding="utf-8") as output:
        output.write(text)
        output.close()

    subprocess.call(["bar-signal.sh 'qtile-groups'"], shell=True)
except:
    logging.error("Unexpected error:", traceback.format_exc())
    sys.exit(1)
