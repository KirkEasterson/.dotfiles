return {
  "echasnovski/mini.bufremove",
  -- enabled = false, -- TODO: replace with a simple binding
  keys = {
    {
      "<C-w>", -- this is causing a delay from window choosing binding
      function()
        require("mini.bufremove").delete()
      end,
      desc = "Generate docs",
    },
  },
  opts = {},
}
