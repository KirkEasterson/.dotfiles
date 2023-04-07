return {
	'kevinhwang91/nvim-ufo',
	enabled = function() return vim.fn.has('nvim-0.9') == 1 end,
	dependencies = {
		'kevinhwang91/promise-async',
		'nvim-treesitter/nvim-treesitter',
	},
	event = "VeryLazy",
	cmd = {
		"UfoEnable",
		"UfoDisable",
		"UfoInspect",
		"UfoAttach",
		"UfoDetach",
		"UfoEnableFold",
		"UfoDisableFold",
	},
	keys = {
		{ 'zR', function() require('ufo').openAllFolds() end },
		{ 'zM', function() require('ufo').closeAllFolds() end },
	},
	opts = {},
}
