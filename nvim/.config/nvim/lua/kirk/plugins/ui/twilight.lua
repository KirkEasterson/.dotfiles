return {
  "folke/twilight.nvim",
  cond = not vim.g.started_by_firenvim,
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
  opts = {},
}
