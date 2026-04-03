vim.pack.add({
  "https://github.com/chentoast/marks.nvim",
})

require("marks").setup({
  signs = true,
  cyclic = true,
})
