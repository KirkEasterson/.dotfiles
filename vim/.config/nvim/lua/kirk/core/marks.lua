local all_user_marks = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

local user_marks_ns = vim.api.nvim_create_namespace("UserMarksSignColumn")
local function update_mark_signs()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(bufnr, user_marks_ns, 0, -1)

  for i = 1, #all_user_marks do
    local mark = all_user_marks:sub(i, i)
    local mark_pos = vim.api.nvim_buf_get_mark(bufnr, mark)

    if mark_pos[1] > 0 then
      local line = mark_pos[1] - 1 -- extmarks use 0-index lines
      vim.api.nvim_buf_set_extmark(bufnr, user_marks_ns, line, 0, {
        sign_text = mark,
        sign_hl_group = "DiagnosticSignInfo",
        priority = 10,
      })
    end
  end
end

for i = 1, #all_user_marks do
  local mark = all_user_marks:sub(i, i)

  vim.keymap.set("n", "m" .. mark, function()
    vim.cmd("normal! m" .. mark)
    update_mark_signs()
  end, { desc = "Add mark " .. mark })

  vim.keymap.set("n", "dm" .. mark, function()
    if string.match(mark, "%u") then
      if vim.api.nvim_del_mark(mark) then
        update_mark_signs()
      end
    else
      if vim.api.nvim_buf_del_mark(vim.api.nvim_get_current_buf(), mark) then
        update_mark_signs()
      end
    end
  end, { desc = "Delete mark " .. mark })
end

-- NOTE: for when changing buffers, text, etc
vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
  callback = update_mark_signs,
})
