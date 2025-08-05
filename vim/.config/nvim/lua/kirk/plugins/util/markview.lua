return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
    "saghen/blink.cmp",
  },
  ft = "md",
  cmd = {
    "Markview",
    "Checkbox",
  },
  keys = {
    {
      "<leader>tm",
      function()
        vim.cmd("Markview Toggle")
      end,
      desc = "Markdown - Toggle checklist",
    },
    {
      "<leader>to",
      function()
        vim.cmd("Checkbox toggle")
      end,
      desc = "Markdown - Toggle checklist",
    },
  },
  opts = {
    preview = {
      icon_provider = "mini",
    },
  },
  config = function(_, opts)
    local opts_with_defaults = vim.tbl_deep_extend("force", require("markview.spec"), opts)
    require("markview").setup(opts_with_defaults)
    require("markview.extras.checkboxes").setup({
      default = "x",
    })
  end,
}
