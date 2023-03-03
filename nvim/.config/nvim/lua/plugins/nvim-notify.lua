return {
	'rcarriga/nvim-notify',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ "<leader>hi", function()
			require("notify").history()
		end }
	},
	config = function()
		vim.notify = require("notify")
		require('notify').setup({
			fps = 60,
			render = "compact",
			stages = "slide",
		})
	end,
}
