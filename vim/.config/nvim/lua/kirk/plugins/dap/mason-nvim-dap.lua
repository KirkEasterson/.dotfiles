return {
  "jay-babu/mason-nvim-dap.nvim",
  -- enabled = false,
  version = false,
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  event = "VeryLazy",
  cmd = {
    "DapInstall",
    "DapUninstall",
  },
  opts = {
    automatic_installation = true,
    automatic_setup = true,
    ensure_installed = {
      "bash",
      "delve",
      "js",
      "python",
    },
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  },
}
