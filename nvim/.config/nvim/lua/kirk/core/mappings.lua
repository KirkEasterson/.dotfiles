local util = require("util")

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
util.map("n", "<leader>w", "<cmd>silent! write<cr>", { desc = "Save file" })
util.map("n", "<leader>q", vim.cmd.q, { desc = "Close window" })
util.map("n", "<leader>z", vim.cmd.qa, { desc = "Quit" })

-- quickfix list navigation
util.map("n", "[Q", vim.cmd.cfirst, { desc = "Quickfix list - first" })
util.map("n", "]Q", vim.cmd.clast, { desc = "Quickfix list - last" })
util.map("n", "[q", function()
  if not (pcall(vim.cmd, "cprev")) then
    vim.cmd("clast")
  end
end, { desc = "Quickfix list - prev" })
util.map("n", "]q", function()
  if not (pcall(vim.cmd, "cnext")) then
    vim.cmd("cfirst")
  end
end, { desc = "Quickfix list - next" })
util.map("n", "<leader>tq", function()
  if vim.tbl_isempty(vim.fn.getqflist()) then
    return
  end
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end, { desc = "Quickfix list - toggle" })

-- location list navigation
util.map("n", "[L", vim.cmd.cfirst, { desc = "Location list - first" })
util.map("n", "]L", vim.cmd.clast, { desc = "Location list - last" })
util.map("n", "[l", function()
  if not (pcall(vim.cmd, "cprev")) then
    vim.cmd("clast")
  end
end, { desc = "Location list - prev" })
util.map("n", "]l", function()
  if not (pcall(vim.cmd, "cnext")) then
    vim.cmd("cfirst")
  end
end, { desc = "Location list - next" })
util.map("n", "<leader>lt", function()
  if vim.tbl_isempty(vim.fn.getloclist(0)) then
    return
  end
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["location"] == 1 then
      vim.cmd("lclose")
      return
    end
  end
  vim.cmd("lopen")
end, { desc = "Location list - toggle" })

-- disable default bindings
vim.keymap.del("i", "<C-W>")
vim.keymap.del("n", "<C-W>d")
vim.keymap.del("n", "<C-W><C-D>")

-- closing buffers
util.map("n", "<C-w>", vim.cmd.bd, { desc = "Delete current buffer" })
util.map("n", "<M-w>", function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end, { desc = "Delete all but current buffer" })

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
util.map("n", "<leader>tl", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative linenumbers" })
