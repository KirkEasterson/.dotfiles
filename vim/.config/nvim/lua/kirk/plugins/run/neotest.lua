return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",

    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
  },
  keys = {
    {
      "<leader>Tr",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").run.run()
        require("neotest").output_panel.open()
      end,
      desc = "Run test",
    },
    {
      "<leader>Ts",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").run.stop()
        require("neotest").output_panel.open()
      end,
      desc = "Stop test",
    },
    {
      "<leader>Tf",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.fn.expand("%"))
        require("neotest").output_panel.open()
      end,
      desc = "Run test file",
    },
    {
      "<leader>Tu",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.fn.getcwd())
        require("neotest").output_panel.open()
      end,
      desc = "Run test suite",
    },
    {
      "<leader>Td",
      function()
        require("neotest").summary.open()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug test",
    },
    {
      "<leader>TT",
      function()
        require("neotest").summary.toggle()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle test panel",
    },
    {
      "<leader>Ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle test summary",
    },
    {
      "[t",
      function()
        require("neotest").jump.prev({ status = "failed" })
      end,
      desc = "Prev failing test",
    },
    {
      "]t",
      function()
        require("neotest").jump.next({ status = "failed" })
      end,
      desc = "Next failing test",
    },
  },
  config = function(_, opts)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    opts = {
      adapters = {
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-race", "-cover", "-timeout=60s" },
        }),
        require("neotest-rust"),
        require("neotest-zig")({
          dap = { adapter = "lldb" },
        }),
      },
      status = {
        virtual_text = false,
        signs = true,
      },
      -- consumers = {
      --   overseer = require("neotest.consumers.overseer"),
      -- },
      -- overseer = {
      --   enabled = true,
      --   -- When this is true (the default), it will replace all neotest.run.* commands
      --   force_default = false,
      -- },
    }
    require("neotest").setup(opts)
  end,
}
