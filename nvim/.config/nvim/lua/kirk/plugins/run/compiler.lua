return {
  "Zeioth/compiler.nvim",
  dependencies = {
    "stevearc/overseer.nvim",
  },
  cmd = {
    "CompilerOpen",
    "CompilerToggleResults",
    "CompilerRedo",
  },
  keys = {
    {
      "<leader>co",
      vim.cmd.CompilerOpen,
      desc = "View TODOs",
    },
  },
  opts = {},
}
