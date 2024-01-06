return {
  "monkoose/matchparen.nvim",
  event = "VimEnter",
  cmd = {
    "MatchParenDisable",
    "MatchParenEnable",
  },
  opts = {},
  init = function()
    vim.g.loaded_matchparen = 1
  end,
}
