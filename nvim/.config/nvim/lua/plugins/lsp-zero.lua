local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	if client.server_capabilities == nil then
		client.server_capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	if client.supports_method('textDocument/formatting') then
		-- buf_set_keymap("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { noremap = true, silent = true })
		buf_set_keymap("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
	end

	-- -- for ufo folding
	-- client.server_capabilities.textDocument = {
	-- 	foldingRange = {
	-- 		dynamicRegistration = false,
	-- 		lineFoldingOnly = true,
	-- 	},
	-- }
end

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
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
	cmd = {
		"LspInfo",
		"LspInstall",
		"LspLog",
		"LspRestart",
		"LspStart",
		"LspStop",
		"LspUninstall",
		"LspZeroFormat",
		"LspZeroSetupServers",
		"LspZeroWorkspaceAdd",
		"LspZeroWorkspaceList",
		"LspZeroWorkspaceRemove",
	},
	keys = {
		-- {
		-- 	"gd",
		-- 	function() vim.lsp.buf.definition() end,
		-- 	desc = "Definition",
		-- },
		-- {
		-- 	"gt",
		-- 	function() vim.lsp.buf.type_definition() end,
		-- 	desc = "Type definition",
		-- },
		{
			"<leader>gr",
			function() vim.lsp.buf.references() end,
			desc = "References",
		},
		-- {
		-- 	"<leader>ga",
		-- 	function() vim.lsp.buf.code_action() end,
		-- 	desc = "Code actions",
		-- },
		-- {
		-- 	"<leader>e",
		-- 	function() vim.lsp.buf.diagnostic() end,
		-- 	desc = "LSP diagnostics",
		-- },
		-- {
		-- 	"[d",
		-- 	"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		-- 	desc = "Previous diagnostic",
		-- },
		-- {
		-- 	"]d",
		-- 	"<cmd>Lspsaga diagnostic_jump_next<CR>",
		-- 	desc = "Next diagnostic",
		-- },
		-- {
		-- 	"<leader>gh",
		-- 	"<cmd>Lspsaga lsp_finder<CR>",
		-- 	desc = "LSP finder",
		-- },
		-- {
		-- 	"K",
		-- 	function() vim.lsp.buf.hover() end,
		-- 	desc = "Hover docs",
		-- },
		-- {
		-- 	"gb",
		-- 	"<cmd>Lspsaga show_buf_diagnostics<CR>",
		-- 	desc = "Buffer diagnostics",
		-- },
	},
	config = function()
		local lsp_zero = require('lsp-zero').preset({
			name = 'minimal',
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = true,
		})

		lsp_zero.ensure_installed({
			"angularls",
			"ansiblels",
			"asm_lsp",
			"azure_pipelines_ls",
			"bashls",
			"clangd",
			"clojure_lsp",
			"cmake",
			"csharp_ls",
			"cssls",
			"cssmodules_ls",
			"denols",
			"diagnosticls",
			"docker_compose_language_service",
			"dockerls",
			"eslint",
			"fennel_language_server",
			"fsautocomplete",
			"golangci_lint_ls", -- TODO: figure out why this doesnt work
			"gopls",
			"gradle_ls",
			"hls",
			"html",
			"jdtls",
			"jsonls",
			"kotlin_language_server",
			"lemminx",
			"lua_ls",
			"ocamllsp",
			"omnisharp",
			"pyright",
			"rust_analyzer",
			"sqlls",
			"taplo",
			"terraformls",
			"texlab",
			"tflint",
			"tsserver",
			"vimls",
			"yamlls",
			"zls",
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

		lsp_zero.configure('yamlls', {
			settings = {
				yaml = {
					keyOrdering = false,
				},
			},
		})

		lsp_zero.configure('lua_ls', {
			settings = {
				Lua = {
					format = {
						enable = false,
					},
					workspace = {
						checkThirdParty = false,
					},
				},
			},
		})

		local null_ls = require('null-ls')
		local null_opts = lsp_zero.build_options('null-ls', {}) -- TODO: use this
		null_ls.setup({
			on_attach = on_attach,
			sources = {
				-- python
				-- null_ls.builtins.code_actions.pyright, -- TODO: find code_actions for python
				null_ls.builtins.diagnostics.pylint, -- TODO: experiment with ruff
				null_ls.builtins.formatting.black,

				-- -- lua
				-- null_ls.builtins.formatting.stylua,

				-- js/ts
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.code_actions.eslint,

				-- styling
				null_ls.builtins.diagnostics.stylelint,

				-- proto buffs
				null_ls.builtins.diagnostics.protoc_gen_lint,
				null_ls.builtins.formatting.buf,

				-- docker
				null_ls.builtins.diagnostics.hadolint,

				-- markdown
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.formatting.markdownlint,

				-- terraform
				null_ls.builtins.diagnostics.terraform_validate,
				null_ls.builtins.diagnostics.tfsec,

				-- general utility
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.code_actions.proselint,
				null_ls.builtins.diagnostics.commitlint,
				null_ls.builtins.diagnostics.todo_comments,
				null_ls.builtins.diagnostics.commitlint,

				-- golang
				-- null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.golangci_lint,
			}
		})

		lsp_zero.nvim_workspace()

		lsp_zero.set_sign_icons({
			error = "󰅘",
			hint = "󰌶",
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
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'npm' },
					{ name = 'path' },
					{ name = 'calc' },
					{ name = 'spell' },
					{ name = 'emoji' },
					{ name = 'buffer' },
					{ name = 'copilot' },
				},
				experimental = {
					native_menu = false,
					ghost_text = true,
				},
			})
		)
		require('lspconfig.ui.windows').default_options.border = 'rounded'
	end,
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
			float = {
				border = "rounded",
			}
		})
	end
}
