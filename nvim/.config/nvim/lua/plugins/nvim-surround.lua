return {
	'kylechui/nvim-surround',
	version = '*',
	event = "BufEnter",
	config = function()
		require('nvim-surround').setup({})
	end,
}
