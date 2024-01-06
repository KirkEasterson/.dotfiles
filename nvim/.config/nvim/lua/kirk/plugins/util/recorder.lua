return {
  "chrisgrieser/nvim-recorder",
  dependencies = {
    "rcarriga/nvim-notify",
  },
  keys = {
    {
      "q",
      function()
        require("recorder").startStopRecording()
      end,
      mode = { "n" },
      desc = "Record macro",
    },
    {
      "Q",
      function()
        require("recorder").playMacro()
      end,
      mode = { "n" },
      desc = "Play macro",
    },
    {
      "<C-q>",
      function()
        require("recorder").switchSlot()
      end,
      mode = { "n" },
      desc = "Toggle macro slot",
    },
    {
      "cq",
      function()
        require("recorder").editMacro()
      end,
      mode = { "n" },
      desc = "Edit macro",
    },
  },
  opts = {
    lessNotifications = false,
  },
}
