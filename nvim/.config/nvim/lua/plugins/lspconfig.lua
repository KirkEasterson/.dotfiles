return {
	'neovim/nvim-lspconfig',
	cond = not vim.g.started_by_firenvim,
	event = 'VimEnter',
	cmd = {
		"LspInfo",
		"LspLog",
		"LspRestart",
		"LspStart",
		"LspStop",
	},
}
