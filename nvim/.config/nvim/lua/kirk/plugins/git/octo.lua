return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",

    "ellisonleao/gruvbox.nvim",
  },
  config = function(_, _)
    vim.treesitter.language.register("markdown", "octo")

    local gruvbox = require("gruvbox")
    local opts = {
      default_merge_method = "squash",
      colors = {
        white = gruvbox.palette.light0,
        grey = gruvbox.palette.gray,
        black = gruvbox.palette.dark0,

        red = gruvbox.palette.light_red_hard,
        dark_red = gruvbox.palette.dark_red,

        green = gruvbox.palette.light_green_hard,
        dark_green = gruvbox.palette.dark_green_hard,

        yellow = gruvbox.palette.bright_yellow,
        dark_yellow = gruvbox.palette.faded_yellow,

        blue = gruvbox.palette.bright_blue,
        dark_blue = gruvbox.palette.faded_blue,

        purple = gruvbox.palette.bright_purple,
      },
    }
    require("octo").setup(opts)
  end,
}
