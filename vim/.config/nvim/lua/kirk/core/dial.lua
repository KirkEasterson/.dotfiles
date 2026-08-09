local cycles = {
  { "true", "false" },
  { "True", "False" },
  { "yes", "no" },
  { "Yes", "No" },
  { "on", "off" },
  { "On", "Off" },
  { "and", "or" },
  { "And", "Or" },
  { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
  { "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" },
}

local function cycle(direction)
  local current_word = vim.fn.expand("<cword>")
  for _, group in ipairs(cycles) do
    for index, val in ipairs(group) do
      if val == current_word then
        local next_index = index + direction
        if next_index > #group then
          next_index = 1
        elseif next_index < 1 then
          next_index = #group
        end

        vim.cmd("normal! ciw" .. group[next_index])
        return
      end
    end
  end

  -- fallback to default behavior if no matches
  if direction == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-a>", true, false, true), "n", false)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-x>", true, false, true), "n", false)
  end
end

-- Keymaps mapping to <C-a> and <C-x>
vim.keymap.set("n", "<C-a>", function()
  cycle(1)
end, { desc = "Increment" })
vim.keymap.set("n", "<C-x>", function()
  cycle(-1)
end, { desc = "Decrement" })
