vim.pack.add({
  "https://github.com/SCJangra/table-nvim",
  "https://github.com/brianhuster/live-preview.nvim",
})

require("table-nvim").setup({
  mappings = false,
})

require("livepreview.config").set({
  sync_scroll = false,
})
