local util = require("util")

-- QOL util.mapping to type commands without needing shift (US-like keyboards only)
util.map("n", ";", ":")
util.map("n", ":", ";")
util.map("v", ";", ":")
util.map("v", ":", ";")

-- center the cursor on movements
util.map("n", "<C-i>", "<C-i>zz")
util.map("n", "<C-o>", "<C-o>zz")
util.map("n", "<C-u>", "<C-u>zz")
util.map("n", "<C-d>", "<C-d>zz")

-- mouse navigation -- TODO: make this work in terminals
util.map("n", "<X1Mouse>", "<C-o>")
util.map("n", "<X2Mouse>", "<C-i>")

-- unmap middle-click paste
util.map("n", "<MiddleMouse>", function() end)

-- faster save and quits
util.map("n", "<leader>w", vim.cmd.w, { desc = "Save file" })
util.map("n", "<leader>q", vim.cmd.q, { desc = "Close buffer" })
util.map("n", "<leader>z", vim.cmd.qa, { desc = "Quit" })

-- reselect text after indenting
util.map("v", "<", "<gv")
util.map("v", ">", ">gv")

-- easier navigation
util.map("n", "n", "nzzzv")
util.map("n", "N", "Nzzzv")
util.map("n", "J", "mzJ`z")

-- -- removed in favor of trouble
-- -- quickfix list navigation
-- util.map("n", "[q", vim.cmd.cprev, { desc = "Quickfix - prev" })
-- util.map("n", "]q", vim.cmd.cnext, { desc = "Quickfix - next" })
-- util.map("n", "[Q", vim.cmd.cfirst, { desc = "Quickfix - first" })
-- util.map("n", "]Q", vim.cmd.clast, { desc = "Quickfix - last" })
-- util.map("n", "<leader>ct", function()
--   local windows = vim.fn.getwininfo()
--   for _, win in pairs(windows) do
--     if win["quickfix"] == 1 then
--       vim.cmd.cclose()
--       return
--     end
--   end
--   vim.cmd.copen()
-- end, { desc = "Quickfix - toggle" })

-- easier yanking/pasting
util.map("v", "y", "ygv<ESC>") -- keep cursor in same spot when yanking
util.map({ "n", "v" }, "<leader>c", "\"+c", { desc = "Change to system clipboard" })
util.map({ "n", "v" }, "<leader>d", "\"+d", { desc = "Delete to system clipboard" })
util.map({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
util.map({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
util.map({ "n", "v" }, "<leader>P", "\"+P", { desc = "Paste from system clipboard" })

util.map("x", "<leader>qp", function()
  -- TODO: take last line of file into account

  -- get current column number
  local col_num = vim.fn.col(".")

  -- get end column of the visual selection
  local end_col = vim.fn.visualmode() == "V" and vim.fn.col("'>") or col_num

  -- check if last character in the line is selected
  local act_last_col = vim.fn.col("$") - 1
  local is_last_char_selected = end_col == act_last_col

  local paste_cmd = is_last_char_selected and "\"_dp" or "\"_dP"
  vim.cmd({
    cmd = "normal",
    args = {
      paste_cmd,
    },
  })
end, { desc = "Paste over selection without erasing unnamed register" })

-- toggle relative line numbers
util.map("n", "tl", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative linenumbers" })

-- disable default bindings
vim.keymap.del("i", "<C-W>")
vim.keymap.del("n", "<C-W>d")
vim.keymap.del("n", "<C-W><C-D>")
