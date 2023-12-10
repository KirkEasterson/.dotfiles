return {
	'jose-elias-alvarez/nvim-lsp-ts-utils',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	ft = {
		'javascript',
		'javascriptreact',
		'jxs',
		'typescript',
		'typescriptreact',
		'tsx',
	},
	opts = {},
}
