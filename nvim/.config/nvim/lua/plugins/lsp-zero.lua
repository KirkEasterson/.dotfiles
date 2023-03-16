local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	if client.supports_method('textDocument/formatting') then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { noremap = true, silent = true })
	end

	local capabilities = client.server_capabilities
	if capabilities == nil then
		capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	-- -- Set autocommands conditional on server_capabilities
	-- if capabilities.document_highlight then
	-- 	vim.api.nvim_exec([[
	-- 		hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	-- 		hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	-- 		hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	-- 		augroup lsp_document_highlight
	-- 			autocmd! * <buffer>
	-- 			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	-- 			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	-- 		augroup END
	-- 	]], false)
	-- end

end

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'jose-elias-alvarez/null-ls.nvim' },
		{ "jay-babu/mason-null-ls.nvim" },

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-nvim-lua' },
		{ "onsails/lspkind.nvim" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-calc" },
		{ "David-Kunz/cmp-npm" },
		{ "f3fora/cmp-spell" },

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
	},
	config = function()
		local lsp = require('lsp-zero').preset({
			name = 'minimal',
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = true,
		})

		lsp.ensure_installed({
			"ansiblels",
			"bashls",
			"clangd",
			"cmake",
			"cssls",
			"cssmodules_ls",
			"diagnosticls",
			"docker_compose_language_service",
			"dockerls",
			"eslint",
			"golangci_lint_ls",
			"gopls",
			"html",
			"jsonls",
			"kotlin_language_server",
			"lemminx",
			"lua_ls",
			"marksman",
			"pyright",
			-- "rnix",
			"rust_analyzer",
			"sqlls",
			"taplo",
			"texlab",
			"tsserver",
			"vimls",
			"yamlls",
		})

		lsp.on_attach(on_attach)

		-- TODO: see if this can be simplified
		local ts_capabilities = vim.lsp.protocol.make_client_capabilities()
		ts_capabilities.textDocument.completion.completionItem.snippetSupport = true
		lsp.configure('tsserver', {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.document_range_formatting = false
			end,
			capabilities = ts_capabilities,
		})

		local null_ls = require('null-ls')
		local null_opts = lsp.build_options('null-ls', {})

		null_ls.setup({
			on_attach = on_attach,
			sources = {
				-- python
				null_ls.builtins.diagnostics.pylint,
				-- null_ls.builtins.code_actions.pyright, -- TODO: find code_actions for python
				null_ls.builtins.formatting.black,

				-- js/ts
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.formatting.prettier,

				-- golang
				-- null_ls.builtins.formatting.gofumpt,
			}
		})

		-- configure lua language server for neovim
		lsp.nvim_workspace()

		lsp.set_sign_icons({
			error = "",
			hint = "",
			info = "",
			warn = "",
		})

		lsp.setup()

		local cmp = require('cmp')
		cmp.setup(
			lsp.defaults.cmp_config({
				window = {
					completion    = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = 'luasnip' },
					{ name = 'nvim_lsp' },
					{ name = 'npm' },
					{ name = 'path' },
					{ name = 'calc' },
					{ name = 'spell' },
					{ name = 'emoji' },
					{ name = 'buffer' },
				},
				experimental = {
					native_menu = false,
					ghost_text = true,
				},
			})
		)
	end,
}
