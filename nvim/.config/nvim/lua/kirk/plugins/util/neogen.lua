return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmd = "Neogen",
  keys = {
    {
      "<leader>ng",
      function()
        require("neogen").generate()
      end,
      desc = "Generate docs",
    },
  },
  opts = {},
}
