vim.pack.add({
  { src = "https://github.com/chentoast/marks.nvim", version = vim.version.range("*") },
})

require("marks").setup({
  signs = true,
  cyclic = true,
})
