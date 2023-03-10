return {
	'williamboman/mason-lspconfig.nvim',
	event = "VeryLazy",
	dependencies = {
		'williamboman/mason.nvim',
	},
	config = {
		automatic_installation = true,
		ensure_installed = {
			"bashls",
			"clangd",
			"cssmodules_ls",
			"dockerls",
			"eslint",
			"gopls",
			"html",
			"jsonls",
			"kotlin_language_server",
			"pyright",
			"rust_analyzer",
			"lua_ls",
			"texlab",
			"tsserver",
			"vimls",
		},
	}
}
