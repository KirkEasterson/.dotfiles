return {
  "ruifm/gitlinker.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>gy",
      mode = { "n", "v" },
      desc = "Copy git URL",
    },
  },
  opts = {
    mappings = "<leader>gy",
    opts = { -- this isn't a typo
      print_url = false,
      add_current_line_on_normal_mode = false,
    },
  },
}
