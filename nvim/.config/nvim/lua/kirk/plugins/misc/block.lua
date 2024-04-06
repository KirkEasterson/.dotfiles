return {
  "HampusHauffman/block.nvim",
  enabled = false,
  cmd = {
    "Block",
    "BlockOff",
    "BlockOn",
  },
  keys = {
    {
      "<leader>bb",
      vim.cmd.Block,
      desc = "Toggle blocks",
    },
  },
  opts = {},
}
