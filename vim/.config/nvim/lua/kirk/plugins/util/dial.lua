return {
  "monaqa/dial.nvim",
  version = false,
  cmd = {
    "DialIncrement",
    "DialDecrement",
  },
  keys = {
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      mode = { "n" },
      desc = "Increment",
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      mode = { "n" },
      desc = "Decrement",
    },
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "visual")
        vim.api.nvim_feedkeys("gv", "n", true)
      end,
      mode = { "v" },
      desc = "Increment",
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "visual")
        vim.api.nvim_feedkeys("gv", "n", true)
      end,
      mode = { "v" },
      desc = "Decrement",
    },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal_int,
        augend.constant.alias.bool,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%d-%m-%Y"],
      },
    })
  end,
}
