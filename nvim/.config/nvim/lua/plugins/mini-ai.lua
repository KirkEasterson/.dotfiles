return {
	'echasnovski/mini.ai',
	enabled = false,
	event = "BufEnter",
	version = '*',
	config = function()
		require('mini.ai').setup({})
	end,
}
