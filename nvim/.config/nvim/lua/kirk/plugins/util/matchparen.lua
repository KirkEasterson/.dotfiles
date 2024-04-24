return {
  "monkoose/matchparen.nvim",
  event = "VimEnter",
  cmd = {
    "MatchParenDisable",
    "MatchParenEnable",
  },
  opts = {
    debounce_time = 10,
  },
  init = function()
    vim.g.loaded_matchparen = 1
  end,
}
