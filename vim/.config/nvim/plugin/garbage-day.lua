vim.schedule(function()
  vim.pack.add({ "zeioth/garbage-day.nvim" })

  require("garbage-day").setup({
    grace_period = 900, -- 15 minutes
    notifications = true,
  })
end)
