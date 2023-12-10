return {
	'antosha417/nvim-lsp-file-operations',
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	event = 'VeryLazy',
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ 'nvim-tree/nvim-tree.lua' },
	},
	opts = {},
}
