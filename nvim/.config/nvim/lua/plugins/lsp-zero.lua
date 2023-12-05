return {
	"VonHeikemen/lsp-zero.nvim",
	cond = not vim.g.started_by_firenvim,
	branch = "v3.x",
	event = {
		"BufNewFile",
		"BufReadPre",
	},
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",

		"hrsh7th/nvim-cmp",

		"nvim-lua/plenary.nvim",
		"Hoffs/omnisharp-extended-lsp.nvim",
		"adelarsq/neofsharp.vim",
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
		-- -- https://github.com/VonHeikemen/lsp-zero.nvim#keybindings
		-- { "K",    desc = "Hover info" },
		-- { "gd",   desc = "Definition" },
		-- { "gD",   desc = "Decleration" },
		-- { "gi",   desc = "List implementations" },
		-- { "go",   desc = "Type definition" },
		-- { "gr",   desc = "List references" },
		-- { "gs",   desc = "Display signature" },
		-- { "<F2>", desc = "Rename" },
		-- { "<F3>", desc = "Format" },
		-- { "<F4>", desc = "Code actions" },
		-- { "gl",   desc = "Show diagnostics" },
		-- { "[d",   desc = "Previous diagnostic" },
		-- { "]d",   desc = "Next diagnostic" },
	},
	opts = {},
	config = function(_, opts)
		local lsp_zero = require("lsp-zero").preset({
			name = "minimal",
			set_lsp_keymaps = true,
			manage_nvim_cmp = false,
			suggest_lsp_servers = true,
		})

		local on_attach = function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })

			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			if client.server_capabilities == nil then
				client.server_capabilities = vim.lsp.protocol.make_client_capabilities()
			end

			if client.supports_method('textDocument/formatting') then
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fc",
					"<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000, async = true })<CR>",
					{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fc",
					"<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000, async = true })<CR>",
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
				on_attach(client, bufnr)
			end,
		})

		lsp_zero.configure('omnisharp', {
			handlers = {
				["textDocument/definition"] = require('omnisharp_extended').handler,
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
				on_attach(client, bufnr)
			end,
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


		lsp_zero.set_sign_icons({
			error = "󰅘",
			hint = "󰌶",
			info = "",
			warn = "",
		})

		lsp_zero.setup(opts)
	end,
}
