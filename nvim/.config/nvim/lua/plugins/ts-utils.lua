return {
	'jose-elias-alvarez/nvim-lsp-ts-utils',
	event = 'BufEnter *.js *.jsx *.ts *.tsx',
	config = function() require("kirk.lsp.ts") end,
}
