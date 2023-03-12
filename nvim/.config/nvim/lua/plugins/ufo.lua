return {
	'kevinhwang91/nvim-ufo',
	event = "BufEnter",
	dependencies = {
		'kevinhwang91/promise-async',
		'nvim-treesitter/nvim-treesitter',

	},
	-- keys = {
	-- 	{ 'zR', require('ufo').openAllFolds},
	-- 	{ 'zM', require('ufo').closeAllFolds },
	-- },
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { 'treesitter', 'indent' }
		end
	},
}
