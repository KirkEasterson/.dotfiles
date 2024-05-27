return {
  "folke/neodev.nvim",
  ft = "lua",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/neotest",
  },
  opts = {
    library = {
      plugins = true,
      types = true,
    },
  },
}
