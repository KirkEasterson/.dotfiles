vim.schedule(function()
  vim.pack.add({
    "https://github.com/yousefhadder/markdown-plus.nvim",
    "https://github.com/brianhuster/live-preview.nvim",
  })

  require("markdown-plus").setup()

  require("livepreview.config").set({
    sync_scroll = false,
  })
end)
