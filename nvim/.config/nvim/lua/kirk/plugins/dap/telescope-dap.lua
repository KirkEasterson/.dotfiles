return {
  "nvim-telescope/telescope-dap.nvim",
  enabled = false,
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
