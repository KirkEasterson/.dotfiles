return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/snacks.nvim",
  },
  keys = {
    {
      "<leader>rr",
      function()
        require("refactoring").select_refactor({ prefer_ex_cmd = true })
      end,
      mode = { "n", "v" },
      desc = "View refactors",
    },
    {
      "<leader>re",
      function()
        require("refactoring").refactor("Extract Variable")
      end,
      mode = { "v" },
      desc = "Extract Variable",
    },
    {
      "<leader>ri",
      function()
        require("refactoring").refactor("Inline Variable")
      end,
      mode = { "n", "v" },
      desc = "Inline Variable",
    },
    {
      "<leader>rf",
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = { "v" },
      desc = "Extract Function",
    },
    {
      "<leader>rF",
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      mode = { "v" },
      desc = "Extract Function To File",
    },
    {
      "<leader>rb",
      function()
        require("refactoring").refactor("Extract Block")
      end,
      desc = "Extract Block",
    },
    {
      "<leader>rB",
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      desc = "Extract Block To File",
    },
    {
      "<leader>rp",
      function()
        require("refactoring").debug.printf({ below = true })
      end,
      desc = "Debug line below",
    },
    {
      "<leader>rP",
      function()
        require("refactoring").debug.printf({ below = false })
      end,
      desc = "Debug line above",
    },
    {
      "<leader>rv",
      function()
        require("refactoring").debug.print_var({ normal = true })
      end,
      mode = { "n", "v" },
      desc = "Debug variable below",
    },
    {
      "<leader>rV",
      function()
        local temp = "test"
        require("refactoring").debug.print_var({ below = false })
      end,
      mode = { "n", "v" },
      desc = "Debug variable above",
    },
    {
      "<leader>rc",
      function()
        require("refactoring").debug.cleanup({})
      end,
      mode = { "n", "v" },
      desc = "Cleanup debug prints",
    },
  },
  opts = {},
}
