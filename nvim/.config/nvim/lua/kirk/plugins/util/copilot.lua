return {
  "github/copilot.vim",
  enabled = false,
  cmd = {
    "Copilot",
  },
  init = function()
    vim.g.copilot_enabled = 0
  end,
}
