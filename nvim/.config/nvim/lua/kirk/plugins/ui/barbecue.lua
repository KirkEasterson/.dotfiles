return {
  "utilyre/barbecue.nvim",
  -- enabled = false,
  cond = not vim.g.started_by_firenvim,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",

    -- I don't use it, but barbecue won't load without it
    "SmiteshP/nvim-navic",
  },
  event = "VimEnter",
  cmd = "Barbecue",
  opts = {
    attach_navic = false,
    show_navic = false,
    symbols = {
      separator = "",
    },
    exclude_filetypes = {
      "DiffviewFiles",
      "NvimTree",
      "Trouble",
      "alpha",
      "dashboard",
      "help",
      "neogitstatus",
      "netrw",
      "packer",
      "startify",
      "toggleterm",
      "terminal",
    },
    theme = {
      normal = {
        fg = nil,
        bg = require("gruvbox").palette.dark0_soft,
      },
    },
  },
}
