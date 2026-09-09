vim.loader.enable()
require("kirk.core.options")
require("kirk.core.marks")
require("kirk.core.grep")
require("kirk.core.completion")
require("kirk.core.filetypes")
require("kirk.core.diagnostics")
require("kirk.core.mappings")
require("kirk.core.autocmds")
require("kirk.core.statusline")
require("kirk.core.dial")
require("kirk.core.netrw")
require("kirk.core.neovide")

-- TODO: use this once snippet become more mature
-- require("kirk.core.snippets")

-- TODO: use this once I can get exact row and col of last edit
-- require("kirk.core.undo")
