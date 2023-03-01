return {
	'jose-elias-alvarez/nvim-lsp-ts-utils',
	event = 'FileType javascript, javascriptreact, typescript, typescriptreact',
	config = function() require("kirk.lsp.ts") end,
}
