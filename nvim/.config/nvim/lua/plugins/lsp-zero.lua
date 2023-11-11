return {
	'VonHeikemen/lsp-zero.nvim',
	cond = not vim.g.started_by_firenvim,
	branch = 'v3.x',
	event = {
		'BufNewFile',
		'BufReadPre',
	},
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
		{ 'rafamadriz/friendly-snippets' },
		{ 'L3MON4D3/LuaSnip' },

		{ 'nvim-lua/plenary.nvim' },
		{ 'Hoffs/omnisharp-extended-lsp.nvim' },
		{ "adelarsq/neofsharp.vim" },
	},
	cmd = {
		"LspInstall",
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
	opts = {},
	config = function(_, opts)
		local lsp_zero = require('lsp-zero').preset({
			name = 'minimal',
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = true,
		})

		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
			if client.server_capabilities == nil then
				client.server_capabilities = vim.lsp.protocol.make_client_capabilities()
			end

			if client.supports_method('textDocument/formatting') then
				-- buf_set_keymap("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { noremap = true, silent = true })
				-- TODO: add binding for formatting block
				buf_set_keymap("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>",
					{ noremap = true, silent = true })
				buf_set_keymap("v", "<leader>fc", "<cmd>lua vim.lsp.buf.range_format({ timeout_ms = 5000 })<CR>",
					{ noremap = true, silent = true })
			end

			-- -- for ufo folding
			-- client.server_capabilities.textDocument = {
			-- 	foldingRange = {
			-- 		dynamicRegistration = false,
			-- 		lineFoldingOnly = true,
			-- 	},
			-- }
		end

		lsp_zero.on_attach(on_attach)

		lsp_zero.configure('tsserver', {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.document_range_formatting = false
			end,
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

		lsp_zero.configure('lua_ls', lsp_zero.nvim_lua_ls({
			settings = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
					},
					format = {
						enable = true,
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}))

		lsp_zero.configure('gopls', {
			settings = {
				gopls = {
					env = {
						GOFLAGS = "-tags=windows,linux,unittest,e2e"
					}
				}
			},
		})


		lsp_zero.nvim_workspace()

		lsp_zero.set_sign_icons({
			error = "󰅘",
			hint = "󰌶",
			info = "",
			warn = "",
		})

		lsp_zero.setup(opts)
	end,
}
