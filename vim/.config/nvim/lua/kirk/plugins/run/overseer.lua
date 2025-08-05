return {
  "stevearc/overseer.nvim",
  -- enabled = false,
  cmd = {
    "OverseerBuild",
    "OverseerClearCache",
    "OverseerClose",
    "OverseerDeleteBundle",
    "OverseerInfo",
    "OverseerLoadBundle",
    "OverseerOpen",
    "OverseerQuickAction",
    "OverseerRun",
    "OverseerRunCmd",
    "OverseerSaveBundle",
    "OverseerTaskAction",
    "OverseerToggle",
  },
  opts = {
    dap = false, -- for lazy loading
    task_list = {
      direction = "bottom",
      min_height = 25,
      max_height = 25,
      default_detail = 1,
      bindings = {
        ["q"] = function()
          vim.cmd.OverseerClose()
        end,
      },
    },
    component_aliases = {
      default_neotest = {
        "on_output_summarize",
        "on_exit_set_status",
        "on_complete_notify",
        "on_complete_dispose",
      },
    },
  },
}
