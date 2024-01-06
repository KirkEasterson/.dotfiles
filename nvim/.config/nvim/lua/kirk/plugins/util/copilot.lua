return {
  "github/copilot.vim",
  cond = not vim.g.started_by_firenvim,
  enabled = false,
  event = "VimEnter",
}
