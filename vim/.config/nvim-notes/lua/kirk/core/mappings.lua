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

-- easier undos
util.map("i", ",", ",<c-g>u")
util.map("i", ".", ".<c-g>u")
util.map("i", "[", "[<c-g>u")
util.map("i", "!", "!<c-g>u")
util.map("i", "?", "?<c-g>u")

-- LSP mappings
vim.keymap.set({ "n" }, "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set({ "n" }, "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
vim.keymap.set({ "n" }, "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })
vim.keymap.set({ "n" }, "go", function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })
vim.keymap.set({ "n" }, "gr", function()
  vim.lsp.buf.references()
end, { desc = "Go to reference" })
vim.keymap.set({ "n" }, "ga", function()
  vim.lsp.buf.code_action()
end, { desc = "Rename" })
vim.keymap.set({ "n" }, "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Diagnostics" })
vim.keymap.set({ "n" }, "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename" })
