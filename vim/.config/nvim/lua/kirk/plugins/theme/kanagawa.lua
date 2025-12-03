return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            bg_search = "none",
            float = {
              bg = "none",
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa")
  end,
}
