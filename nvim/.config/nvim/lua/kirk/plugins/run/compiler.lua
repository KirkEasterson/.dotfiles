return {
  "Zeioth/compiler.nvim",
  enabled = false,
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
