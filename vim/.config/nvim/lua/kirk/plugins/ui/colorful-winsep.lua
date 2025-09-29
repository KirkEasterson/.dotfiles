return {
  "nvim-zh/colorful-winsep.nvim",
  enabled = false, -- TODO: fix errors that randomly show up
  dependencies = {
    "ellisonleao/gruvbox.nvim",
  },
  event = "VeryLazy",
  opts = {
    interval = 5,
    smooth = false,
    no_exec_files = {
      "Lazy",
      "TelescopePrompt",
      "mason",
    },
    animate = {
      enabled = false,
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "ColorfulWinSep", { bg = nil, fg = require("gruvbox").palette.bright_orange })
  end,
}
