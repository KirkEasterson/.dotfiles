vim.pack.add({
  "https://github.com/smjonas/live-command.nvim",
})

require("live-command").setup({
  commands = {
    Norm = {
      cmd = "norm",
    },
  },
})
