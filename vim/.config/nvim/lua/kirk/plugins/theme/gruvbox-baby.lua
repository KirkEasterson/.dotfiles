return {
  "luisiacc/gruvbox-baby",
  -- enabled = false,
  version = false,
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    vim.g.gruvbox_baby_background_color = "dark"
    vim.g.gruvbox_baby_transparent_mode = not vim.g.gonvim_running

    vim.cmd({
      cmd = "colorscheme",
      args = {
        "gruvbox-baby",
      },
    })

    vim.api.nvim_set_hl(0, "ColorColumn", { bg = require("gruvbox").palette.dark0 })
  end,
}
