return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>re",
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = { "v" },
      desc = "Extract Function",
    },
    {
      "<leader>rf",
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      mode = { "v" },
      desc = "Extract Function To File",
    },
    {
      "<leader>rv",
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
      "<leader>rb",
      function()
        require("refactoring").refactor("Extract Block")
      end,
      desc = "Extract Block",
    },
    {
      "<leader>rbf",
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      desc = "Extract Block To File",
    },
    {
      "<leader>rr",
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      mode = { "n", "v" },
      desc = "View refactors",
    },
    {
      "<leader>rp",
      function()
        require("refactoring").debug.printf()
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
      desc = "Debug variable below",
    },
    {
      "<leader>rv",
      function()
        require("refactoring").debug.print_var()
      end,
      mode = { "v" },
      desc = "Debug variable above",
    },
    {
      "<leader>rc",
      function()
        require("refactoring").debug.cleanup()
      end,
      mode = { "n", "v" },
      desc = "Cleanup debug prints",
    },
  },
  opts = {},
  config = function(_, opts)
    require("refactoring").setup(opts)
    require("telescope").load_extension("refactoring")
  end,
}
