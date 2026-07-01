vim.schedule(function()
  vim.pack.add({
    { src = "https://github.com/smjonas/live-command.nvim", version = vim.version.range("*") },
  })

  require("live-command").setup({
    commands = {
      Norm = {
        cmd = "norm",
      },
    },
  })
end)
