return {
	'echasnovski/mini.animate',
	enabled = false,
	event = "BufEnter",
	version = '*',
	config = function()
		require('mini.animate').setup({
			cursor = {
				enable = false,
			},
			scroll = {
				enable = true,
			},
			resize = {
				enable = false,
			},
			open = {
				enable = false,
			},
			close = {
				enable = false,
			},
		})
	end
}
