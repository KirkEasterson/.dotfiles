local ns_id = vim.api.nvim_create_namespace("FlashUndo")
vim.api.nvim_set_hl(0, "FlashUndo", { bg = "#888888", fg = "#000000", default = true })

local function highlight_undo(cmd)
  vim.cmd(cmd)
  local start_pos = vim.fn.getpos("'[")
  local end_pos = vim.fn.getpos("']")

  local start_row = start_pos[2]
  local start_col = start_pos[3]
  local end_row = end_pos[2]
  local end_col = end_pos[3]

  if start_row == 0 or end_row == 0 or start_row >= end_row then
    return
  end

  if start_row == end_row and start_col == end_col then
    return
  end

  local curr_buf = vim.api.nvim_get_current_buf()
  vim.hl.range(curr_buf, ns_id, "FlashUndo", { end_row, end_col }, { start_row, start_col }, { timeout = 200 })
end

-- Map u and C-r to the custom function
vim.keymap.set("n", "u", function()
  highlight_undo("undo")
end, { silent = true })
vim.keymap.set("n", "<C-r>", function()
  highlight_undo("redo")
end, { silent = true })
