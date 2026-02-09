return {
  "Weissle/persistent-breakpoints.nvim",
  lazy = false,
  keys = {
    {
      "<leader>dp",
      function()
        require("persistent-breakpoints.api").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dP",
      function()
        require("persistent-breakpoints.api").clear_all_breakpoints()
      end,
      desc = "Clear breakpoints",
    },
  },
  opts = {
    load_breakpoints_event = { "BufReadPost" },
  },
}
