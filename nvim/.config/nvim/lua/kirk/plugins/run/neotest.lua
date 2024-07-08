return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",

    "Issafalcon/neotest-dotnet",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-jest",
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
    opts = {
      adapters = {
        -- the below lines are the reason opts must be defined in config
        require("neotest-go")({
          args = { "-race", "-cover", "-timeout=60s" },
        }),
        require("neotest-dotnet"),
        require("neotest-python"),
      },
      status = {
        virtual_text = false, -- TODO: make a PR for `hlmode: combine` https://github.com/APZelos/blamer.nvim/issues/47
        signs = true,
      },
    }
    require("neotest").setup(opts)
  end,
}
