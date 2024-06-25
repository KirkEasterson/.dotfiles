return {
  "folke/trouble.nvim",
  enabled = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleRefresh",
    "TroubleToggle",
  },
  keys = {
    {
      "<leader>ct",
      function()
        require("trouble").toggle()
      end,
      desc = "Trouble - toggle",
    },
    {
      "[q",
      function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end,
      desc = "Trouble - prev",
    },
    {
      "]q",
      function()
        require("trouble").next({ skip_groups = true, jump = true })
      end,
      desc = "Trouble - next",
    },
    {
      "[Q",
      function()
        require("trouble").first({ skip_groups = true, jump = true })
      end,
      desc = "Trouble - first",
    },
    {
      "]Q",
      function()
        require("trouble").last({ skip_groups = true, jump = true })
      end,
      desc = "Trouble - last",
    },
    -- {
    --   "gr",
    --   function()
    --     require("trouble").toggle("lsp_references")
    --   end,
    --   desc = "List references",
    -- },
    -- {
    --   "gd",
    --   function()
    --     require("trouble").toggle("lsp_definitions")
    --   end,
    --   desc = "Definition",
    -- },
    -- {
    --   "gt",
    --   function()
    --     require("trouble").toggle("lsp_type_definitions")
    --   end,
    --   desc = "Type definition",
    -- },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
