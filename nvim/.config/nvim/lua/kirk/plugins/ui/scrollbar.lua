return {
  "petertriho/nvim-scrollbar",
  enabled = false,
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  event = "VeryLazy",
  opts = {
    hide_if_all_visible = true,
    handlers = {
      gitsigns = true,
    },
  },
}
