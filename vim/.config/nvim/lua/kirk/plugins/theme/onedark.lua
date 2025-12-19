return {
  "navarasu/onedark.nvim",
  enabled = false,
  priority = 1000,
  opts = {
    style = "deep",
    transparent = true,
    code_style = {
      comments = "italic",
      keywords = "italic",
      functions = "bold",
      strings = "italic",
      variables = "bold",
    },
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
