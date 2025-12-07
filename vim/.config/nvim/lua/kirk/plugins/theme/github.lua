return {
  "projekt0n/github-nvim-theme",
  enabled = false,
  name = "github-theme",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      transparent = true,
      hide_end_of_buffer = false,
      styles = {
        comments = "italic",
        functions = "italic,bold",
        keywords = "bold",
        variables = "bold",
        conditionals = "bold",
        constants = "bold",
        numbers = "italic",
        operators = "italic",
        strings = "italic",
        types = "bold",
      },
      inverse = {
        match_paren = true,
        visual = true,
        search = true,
      },
    },
  },
  config = function(_, opts)
    require("github-theme").setup(opts)
    vim.cmd("colorscheme github_dark_colorblind")
  end,
}
