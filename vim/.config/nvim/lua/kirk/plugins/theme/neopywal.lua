return {
  "RedsXDD/neopywal.nvim",
  enabled=false,
  name = "neopywal",
  lazy = false,
  priority = 1000,
  opts = {
    -- use_palette = "solarized",
    transparent_background = true,
    dim_inactive = false,
    styles = {
      comments = { "italic" },
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      includes = { "italic" },
      strings = {},
      variables = { "bold" },
      numbers = {},
      booleans = {},
      types = { "bold" },
      operators = {},
    },
  },
  config = function(_, opts)
    require("neopywal").setup(opts)
    -- vim.cmd.colorscheme("neopywal")
  end,
}
