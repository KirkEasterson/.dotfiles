return {
  "jamestthompson3/nvim-remote-containers",
  cond = not vim.g.started_by_firenvim,
  cmd = {
    "AttachToContainer",
    "BuildImage",
    "StartImage",
    "ComposeUp",
    "ComposeDown",
    "ComposeDestroy",
  },
  opts = {},
}
