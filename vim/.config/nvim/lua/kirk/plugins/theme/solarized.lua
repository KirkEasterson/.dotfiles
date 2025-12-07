return {
  "Tsuzat/NeoSolarized.nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = false,
  },
  config = function(_, opts)
    require("NeoSolarized").setup(opts)
    vim.cmd.colorscheme("NeoSolarized")
  end,
}
