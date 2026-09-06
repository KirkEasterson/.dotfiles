vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
  else
    return "<C-j>"
  end
end, { desc = "Snippet - next", expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
  else
    return "<C-k>"
  end
end, { desc = "Snippet - prev", expr = true, silent = true })
