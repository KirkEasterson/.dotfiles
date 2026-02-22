return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",

    "rcarriga/nvim-dap-ui",

    -- "nvim-neotest/neotest-go", -- TODO: use this once it is fixed
    {
      "fredrikaverpil/neotest-golang",
      version = "*", -- Optional, but recommended; track releases
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
    "marilari88/neotest-vitest",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
  },
  keys = {
    {
      "<leader>tr",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").output_panel.open()
        require("neotest").run.run()
      end,
      desc = "Run test",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").output_panel.open()
        require("neotest").run.stop()
      end,
      desc = "Stop test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").output_panel.open()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run test file",
    },
    {
      "<leader>tu",
      function()
        require("neotest").summary.open()
        require("neotest").output_panel.clear()
        require("neotest").output_panel.open()
        require("neotest").run.run(vim.fn.getcwd())
      end,
      desc = "Run test suite",
    },
    {
      "<leader>td",
      function()
        require("neotest").summary.open()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug test",
    },
    {
      "<leader>tt",
      function()
        require("neotest").summary.toggle()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle test panel",
    },
    {
      "<leader>ts",
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
      level = vim.log.levels.DEBUG,
      adapters = {
        -- require("neotest-go")({
        --   experimental = {
        --     test_table = true,
        --   },
        --   args = { "-race", "-cover", "-timeout=60s" },
        --   recursive_run = true,
        -- }),
        require("neotest-rust"),
        require("neotest-zig")({
          dap = { adapter = "lldb" },
        }),
        require("neotest-golang")({}),
        require("neotest-vitest"),
      },
      status = {
        virtual_text = false,
        signs = true,
      },
    }
    require("neotest").setup(opts)
  end,
}
