return {
  "luisiacc/gruvbox-baby",
  -- enabled = false,
  version = false,
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    vim.g.gruvbox_baby_background_color = "dark"

    vim.cmd({
      cmd = "colorscheme",
      args = {
        "gruvbox-baby",
      },
    })
  end,
}
