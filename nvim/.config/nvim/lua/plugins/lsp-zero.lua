local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	if client.supports_method('textDocument/formatting') then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { noremap = true, silent = true })
	end

	if client.server_capabilities == nil then
		client.server_capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	-- for ufo folding
	capabilities.textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	}
end

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	event = "VeryLazy",
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

		{ 'nvim-lua/plenary.nvim' },
		{ 'Hoffs/omnisharp-extended-lsp.nvim' },
		{ "adelarsq/neofsharp.vim" },
	},
	keys = {
		{ "gd", function() vim.lsp.buf.definition() end },
		{ "gt", function() vim.lsp.buf.type_definition() end },
		-- { "ga", function () vim.lsp.buf.code_action() end },
		-- { "<leader>e", function () vim.lsp.buf.diagnostic() end },
		-- { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" }, --
		-- { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" }, --
		-- { "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>" },
		-- { "K", function() vim.lsp.buf.hover() end}, --
		-- { "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>" }, --
	},
	config = function()
		local lsp_zero = require('lsp-zero').preset({
			name = 'minimal',
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = true,
		})

		lsp_zero.ensure_installed({
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
			"fsautocomplete",
			"golangci_lint_ls",
			"gopls",
			"html",
			"jsonls",
			"kotlin_language_server",
			"lemminx",
			"lua_ls",
			"marksman",
			"omnisharp",
			"pyright",
			"rust_analyzer",
			"sqlls",
			"taplo",
			"terraformls",
			"texlab",
			"tsserver",
			"vimls",
			"yamlls",
			-- "rnix",
		})

		lsp_zero.on_attach(on_attach)

		-- TODO: see if this can be simplified
		local ts_capabilities = vim.lsp.protocol.make_client_capabilities()
		ts_capabilities.textDocument.completion.completionItem.snippetSupport = true
		lsp_zero.configure('tsserver', {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.document_range_formatting = false
			end,
			capabilities = ts_capabilities,
		})

		local csharp_on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
			on_attach(client, bufnr)
		end
		lsp_zero.configure('omnisharp', {
			handlers = {
				["textDocument/definition"] = require('omnisharp_extended').handler,
			},
			on_attach = csharp_on_attach,
			cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
			enable_import_completion = true,
			organize_imports_on_format = true,
		})

		local null_ls = require('null-ls')
		local null_opts = lsp_zero.build_options('null-ls', {})
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
		lsp_zero.nvim_workspace()

		lsp_zero.set_sign_icons({
			error = "",
			hint = "",
			info = "",
			warn = "",
		})

		lsp_zero.setup()

		local cmp = require('cmp')
		cmp.setup(
			lsp_zero.defaults.cmp_config({
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
		require('lspconfig.ui.windows').default_options.border = 'rounded'
	end,
}
