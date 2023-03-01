return {
	'jose-elias-alvarez/nvim-lsp-ts-utils',
	event = {
		'FileType javascript',
		'FileType javascriptreact',
		'FileType typescript',
		'FileType typescriptreact',
	},
	config = function() require("kirk.lsp.ts") end,
}
