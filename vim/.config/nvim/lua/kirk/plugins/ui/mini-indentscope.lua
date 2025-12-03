return {
  "nvim-mini/mini.indentscope",
  -- enabled = false,
  event = "VeryLazy",
  opts = {
    symbol = "│",
    draw = {
      delay = 10,
      animation = function() -- disable animation
        return 0
      end,
    },
  },
}
