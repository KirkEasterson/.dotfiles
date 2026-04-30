vim.pack.add({
  "https://github.com/SCJangra/table-nvim",
  "https://github.com/brianhuster/live-preview.nvim",
})

vim.opt.tabstop = 2 -- number of visual spaces per tab
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.shiftwidth = 2 -- number of spaces when indenting with <> keys
vim.opt.expandtab = true -- use spaces for tabs

require("table-nvim").setup({
  mappings = false,
})

require("livepreview.config").set({
  sync_scroll = false,
})
