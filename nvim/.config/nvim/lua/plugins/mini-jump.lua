return {
	'echasnovski/mini.jump',
	event = "BufEnter",
	version = '*',
	config = function()
		require('mini.jump').setup({
			mappings = {
				repeat_jump = '', -- TODO: find another mapping for this
			},
		})
	end

}