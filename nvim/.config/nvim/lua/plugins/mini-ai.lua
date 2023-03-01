return {
	'echasnovski/mini.ai',
	event = "BufEnter",
	version = '*',
	config = function()
		require('mini.ai').setup({})
	end,
}
