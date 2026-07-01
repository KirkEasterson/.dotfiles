vim.schedule(function()
  vim.pack.add({
    { src = "https://github.com/tzachar/highlight-undo.nvim", version = vim.version.range("*") },
  })

  require("highlight-undo").setup()
end)
