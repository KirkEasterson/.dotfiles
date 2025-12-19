return {
  "olimorris/onedarkpro.nvim",
  enabled = false,
  priority = 1000,
  cmd={
    "OneDarkProCache",
    "OneDarkProClean",
    "OneDarkProColors",
    "OneDarkProExtras",
  },
  opts = {
    styles = {
      types = "bold",
      methods = "bold",
      numbers = "NONE",
      strings = "italic",
      comments = "italic",
      keywords = "bold,italic",
      constants = "bold",
      functions = "bold",
      operators = "NONE",
      variables = "bold",
      parameters = "bold",
      conditionals = "italic",
      virtual_text = "NONE",
    },
    options = {
      cursorline = true,
      transparency = true,
      terminal_colors = false,
      highlight_inactive_windows = false,
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd("colorscheme vaporwave")
  end,
}
