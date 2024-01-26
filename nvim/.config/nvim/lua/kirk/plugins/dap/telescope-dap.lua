return {
  "nvim-telescope/telescope-dap.nvim",
  cond = not vim.g.started_by_firenvim,
  version = "*",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>ds",
      function()
        require("telescope").extensions.dap.list_breakpoints({})
      end,
      desc = "Toggle breakpoint",
    },
  },
  config = function()
    require("telescope").load_extension("dap")
  end,
}
