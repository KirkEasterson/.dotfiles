return {
  "uZer/pywal16.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("pywal16").setup(opts)
    vim.cmd.colorscheme("pywal16")
  end,
}
