require("full-border"):setup({ type = ui.Border.PLAIN })
require("no-status"):setup()

th.git = th.git or {}

th.git.unknown = ui.Style():fg("blue")
th.git.modified = ui.Style():fg("yellow")
th.git.added = ui.Style():fg("green")
th.git.untracked = ui.Style():fg("grey")
th.git.ignored = ui.Style():fg("grey")
th.git.updated = ui.Style():fg("yellow")
th.git.deleted = ui.Style():fg("red")
th.git.clean = ui.Style():fg("green")

th.git.unknown_sign = ""
th.git.modified_sign = ""
th.git.added_sign = ""
th.git.untracked_sign = ""
th.git.ignored_sign = ""
th.git.updated_sign = ""
th.git.deleted_sign = ""
th.git.clean_sign = " "
require("git"):setup()
