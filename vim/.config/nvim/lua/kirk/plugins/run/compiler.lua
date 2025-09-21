return {
  "Zeioth/compiler.nvim",
  enabled = false,
  dependencies = {
    "stevearc/overseer.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "CompilerOpen",
    "CompilerToggleResults",
    "CompilerRedo",
    "CompilerStop",
  },
  keys = {
    {
      "<leader>co",
      vim.cmd.CompilerOpen,
      desc = "Compiler",
    },
    {
      "<leader>cn",
      function()
        vim.cmd.CompilerStop()
        vim.cmd.CompilerRedo()
      end,
      desc = "Compiler",
    },
    {
      "<leader>cl",
      vim.cmd.CompilerToggleResults,
      desc = "Compiler",
    },
  },
  opts = {},
}
