return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = false,
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  event = "UIEnter",
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
      "node2",
      "python",
      -- "haskell",
      -- "javadbg",
      -- "kotlin",
    },
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  },
}
