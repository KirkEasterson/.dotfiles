return {
  "theHamsta/nvim-dap-virtual-text",
  -- enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    commented = true,
    only_first_definition = false,
    all_references = true,
  },
}
