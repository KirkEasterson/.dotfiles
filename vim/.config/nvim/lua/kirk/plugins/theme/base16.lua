return {
  "RRethy/base16-nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    vim.cmd("colorscheme base16-bright")
  end,
}
