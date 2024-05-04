return {
  "eandrju/cellular-automaton.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = "CellularAutomaton",
  keys = {
    {
      "<leader>fml",
      function()
        require("cellular-automaton").start_animation("make_it_rain")
      end,
      desc = "Make it rain",
    },
  },
  config = function()
    require("cellular-automaton").register_animation({
      name = "slide",
      fps = 60,
      update = function(grid)
        for i = 1, #grid do
          local prev = grid[i][#grid[i]]
          for j = 1, #grid[i] do
            grid[i][j], prev = prev, grid[i][j]
          end
        end
        return true
      end,
    })
  end,
}
