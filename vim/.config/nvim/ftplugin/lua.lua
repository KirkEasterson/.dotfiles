vim.pack.add({
  "https://github.com/folke/lazydev.nvim",
})

require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "wezterm-types", mods = { "wezterm" } },
    { path = "nvim-dap-ui" },
  },
})
