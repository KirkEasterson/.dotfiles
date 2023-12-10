return {
	"eandrju/cellular-automaton.nvim",
	cmd = 'CellularAutomaton',
	keys = {
		{
			"<leader>fml",
			function() require("cellular-automaton").start_animation("make_it_rain") end,
			desc = "Make it rain",
		},
	},
	config = function()
		local config = {
			fps = 50,
			name = 'snake',
		}

		config.update = function(grid)
			for i = 1, #grid do
				local prev = grid[i][#(grid[i])]
				for j = 1, #(grid[i]) do
					grid[i][j], prev = prev, grid[i][j]
				end
			end
			return true
		end

		require("cellular-automaton").register_animation(config)
	end,
}
