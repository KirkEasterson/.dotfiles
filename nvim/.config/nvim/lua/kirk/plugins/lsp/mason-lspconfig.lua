return {
	"williamboman/mason-lspconfig.nvim",
	cond = not vim.g.started_by_firenvim,
	event = "UIEnter",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	cmd = {
		"LspInstall",
		"LspUninstall",
	},
	opts = {
		-- -- these were moved to lsp-zero
		-- automatic_installation = true,
		-- ensure_installed = {
		-- 	"ansiblels",
		-- 	"asm_lsp", -- assembly
		-- 	"bashls",
		-- 	"clangd",
		-- 	"cmake",
		-- 	"csharp_ls",
		-- 	"cssls",
		-- 	"diagnosticls",
		-- 	"docker_compose_language_service",
		-- 	"dockerls",
		-- 	"eslint",
		-- 	"fsautocomplete",
		-- 	"golangci_lint_ls",
		-- 	"gopls",
		-- 	"hls", -- haskell
		-- 	"html",
		-- 	"jdtls", -- java
		-- 	"jsonls",
		-- 	"kotlin_language_server",
		-- 	"lemminx", -- xml
		-- 	"lua_ls",
		-- 	"ocamllsp",
		-- 	"omnisharp",
		-- 	"pyright",
		-- 	"rnix", -- nix
		-- 	"rust_analyzer",
		-- 	"sqlls",
		-- 	"taplo", -- toml
		-- 	"terraformls",
		-- 	"texlab",
		-- 	"tflint",
		-- 	"tsserver",
		-- 	"vimls",
		-- 	"yamlls",
		-- 	"zls", -- zig
		-- },
		-- -- handlers = {
		-- -- 	require('lsp-zero').default_setup,
		-- -- },
	},
}
