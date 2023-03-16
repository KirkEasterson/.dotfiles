return {
	'rcarriga/nvim-notify',
	enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ "<leader>hi", function()
			require("notify").history()
		end }
	},
	config = function()
		require('notify').setup({
			fps = 120,
			render = "compact",
			stages = "slide",
		})
	end,
}
