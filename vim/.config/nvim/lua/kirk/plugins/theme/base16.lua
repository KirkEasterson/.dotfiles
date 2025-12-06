return {
  "RRethy/base16-nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {
    base00 = "#000000",
    base01 = "#ff0000",
    base02 = "#00ff00",
    base03 = "#ffff00",
    base04 = "#0000ff",
    base05 = "#ff00ff",
    base06 = "#00ffff",
    base07 = "#ffffff",
    base08 = "#555555",
    base09 = "#ff5555",
    base0A = "#55ff55",
    base0B = "#ffff55",
    base0C = "#5555ff",
    base0D = "#ff55ff",
    base0E = "#55ffff",
    base0F = "#bbbbbb",
  },
  config = function(_, opts)
    require("base16-colorscheme").setup(opts)
    -- vim.cmd("colorscheme base16-bright")
  end,
}
