return {
	'windwp/nvim-ts-autotag',
	cond = not vim.g.started_by_firenvim,
	ft = {
		'html',
		'xml',
		'javascriptreact',
		'jsx',
		'typescriptreact',
		'tsx',
	},
	opts = {},
}
