return {
  "nvim-zh/colorful-winsep.nvim",
  -- enabled = false,
  dependencies = {
    "ellisonleao/gruvbox.nvim",
  },
  branch = "main", -- `alpha` is the "main" branch, not `main`
  event = "WinNew",
  opts = {
    interval = 5,
    smooth = false,
    no_exec_files = {
      "Lazy",
      "TelescopePrompt",
      "mason",
    },
    highlight = {
      bg = nil,
      fg = require("gruvbox").palette.bright_orange,
    },
    -- anchor = {
    --   left = { height = 0, x = -1, y = -1 },
    --   right = { height = 0, x = -1, y = 0 },
    --   up = { width = 0, x = -2, y = 0 },
    --   bottom = { width = 0, x = 1, y = 0 },
    -- },
  },
}
