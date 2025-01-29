return {
  "Bekaboo/dropbar.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    bar = {
      menu = {
        preview = false,
      },
    },
  },
}
