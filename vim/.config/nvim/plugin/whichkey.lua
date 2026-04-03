vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})

require("which-key").setup({
  preset = "helix",
  delay = 1000,
  notify = false,
  show_help = false,
})
