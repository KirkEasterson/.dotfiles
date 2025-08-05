return {
  "echasnovski/mini.indentscope",
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
  config = function(_, opts)
    require("mini.indentscope").setup(opts)

    vim.cmd("highlight MiniIndentscopeSymbol guifg=" .. require("gruvbox").palette.faded_blue)
  end,
}
