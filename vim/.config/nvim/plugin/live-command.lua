vim.schedule(function()
  vim.pack.add({
    "https://github.com/smjonas/live-command.nvim", -- TODO: use a stable version once there's a new release
  })

  require("live-command").setup({
    commands = {
      Norm = {
        cmd = "norm",
      },
    },
  })
end)
