local util = require("util")

-- faster save and quits
util.map("n", "<leader>w", "<cmd>silent! write<cr>", { desc = "Save file" })
util.map("n", "<leader>q", vim.cmd.q, { desc = "Close window" })
util.map("n", "<leader>z", vim.cmd.qa, { desc = "Quit" })

-- reselect text after indenting
util.map("v", "<", "<gv")
util.map("v", ">", ">gv")

-- easier navigation
util.map("n", "n", "nzzzv")
util.map("n", "N", "Nzzzv")
util.map("n", "J", "mzJ`z")

-- easier yanking/pasting
util.map("v", "y", "ygv<ESC>") -- keep cursor in same spot when yanking

-- system clipboard interaction
util.map({ "v" }, "<leader>x", "\"+x", { desc = "Cut to system clipboard" })
util.map({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
util.map({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
util.map({ "n", "v" }, "<leader>P", "\"+P", { desc = "Paste from system clipboard" })
