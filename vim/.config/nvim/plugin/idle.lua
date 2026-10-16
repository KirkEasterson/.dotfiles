vim.schedule(function()
  vim.pack.add({ "https://codeberg.org/dannyfritz/on-idle.nvim" })

  require("on-idle").setup({
    timeout_seconds = 1800, -- 30 minutes
  })
end)
