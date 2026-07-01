vim.schedule(function()
  vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim", version = vim.version.range("*") },
  })

  require("which-key").setup({
    preset = "helix",
    delay = 1000,
    notify = false,
    show_help = false,
  })
end)
