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
util.map({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
util.map({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
util.map({ "n", "v" }, "<leader>P", "\"+P", { desc = "Paste from system clipboard" })

-- don't add '{' or '}' to the jumplist
util.map({ "n" }, "{", ":keepjumps normal! {<cr>", { desc = "Don't add '{' to the jumplist" })
util.map({ "n" }, "}", ":keepjumps normal! }<cr>", { desc = "Don't add '}' to the jumplist" })
util.map({ "x" }, "{", ":<C-u>keepjumps normal! gv{<cr>", { desc = "Don't add '{' to the jumplist" })
util.map({ "x" }, "}", ":<C-u>keepjumps normal! gv}<cr>", { desc = "Don't add '}' to the jumplist" })

util.map("x", "<leader>qp", function()
  -- this is still flaky, but it's an improvement from the first iteration
  local paste_cmd = "P" -- paste _before_
  local visual_mode = vim.fn.mode()

  if visual_mode == "^V" then -- visual-block mode
    -- do nothing
    -- NOTE: the above value isn't the correct value to check for
    return
  elseif visual_mode == "v" then -- visual mode
    local last_col = vim.fn.col("$") - 1
    local selection_end = vim.fn.col("'>")

    local is_last_col_selected = (selection_end == last_col)
    if is_last_col_selected then
      paste_cmd = "p" -- paste _after_
    end
  elseif visual_mode == "V" then -- visual-line mode
    local curr_line = vim.fn.line(".")
    local last_line = vim.fn.line("$")
    local is_last_line_selected = (curr_line == last_line)
    if is_last_line_selected then
      paste_cmd = "p" -- paste _after_
    end
  end

  vim.cmd({
    cmd = "normal",
    args = {
      "\"_d" .. paste_cmd,
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
