return {
  "toppair/peek.nvim",
  enabled = false,
  build = "deno task --quiet build:fast",
  keys = {
    {
      "<leader>mdp",
      function()
        require("peek").open()
      end,
      desc = "Open markdown preview",
    },
    {
      "<leader>mds",
      function()
        require("peek").close()
      end,
      desc = "Close markdown preview",
    },
    {
      "<leader>mdt",
      function()
        local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      desc = "Toggle markdown preview",
    },
  },
  opts = {},
}
