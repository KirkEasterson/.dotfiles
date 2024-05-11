return {
  "luisiacc/gruvbox-baby",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    vim.cmd({
      cmd = "colorscheme",
      args = {
        "gruvbox-baby",
      },
    })
  end,
}
