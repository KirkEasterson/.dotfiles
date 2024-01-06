return {
  "christoomey/vim-tmux-navigator",
  cond = not vim.g.started_by_firenvim,
  enabled = false,
  event = "VeryLazy",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  init = function()
    -- vim.api.nvim_set_var("mkdp_auto_close", 0)
  end,
}
