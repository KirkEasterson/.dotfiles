return {
  "chipsenkbeil/distant.nvim",
  cond = not vim.g.started_by_firenvim,
  version = "v0.1.2",
  cmd = {
    "DistantInstall",
    "DistantLaunch",
    "DistantOpen",
  },
  opts = {},
}
