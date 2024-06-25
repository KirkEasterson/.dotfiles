return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  event = "VimEnter",
  opts = {
    hide_if_all_visible = true,
    handlers = {
      gitsigns = true,
    },
  },
}
