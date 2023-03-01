return {
	'echasnovski/mini.nvim',
	branch = 'main',
	config = function()
		require('mini.surround').setup({})
		require('mini.ai').setup()
		require('mini.jump').setup({
			mappings = {
				repeat_jump = '', -- TODO: find another mapping for this
			},
		})
		-- require('mini.animate').setup({
		-- 	cursor = {
		-- 		enable = false,
		-- 	},
		-- 	scroll = {
		-- 		enable = true,
		-- 	},
		-- 	resize = {
		-- 		enable = false,
		-- 	},
		-- 	open = {
		-- 		enable = false,
		-- 	},
		-- 	close = {
		-- 		enable = false,
		-- 	},
		-- })
	end,
}
