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
  },
}
