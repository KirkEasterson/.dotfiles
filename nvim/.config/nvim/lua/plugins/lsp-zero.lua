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
			local disabled_formatting = {
				"tsserver",
				"volar",
				"lua_ls",
			}
			if disabled_formatting[client.name] ~= nil then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end

			lsp_zero.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false,
			})

			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			vim.keymap.set({ "n", "v" }, "<leader>fc", function()
				vim.lsp.buf.format({ timeout_ms = 5000, async = true })
			end, { noremap = true, silent = true, buffer = bufnr })

			-- for ufo folding
			client.server_capabilities.textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			}
		end

		lsp_zero.on_attach(on_attach)

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"ansiblels",
				"asm_lsp", -- assembly
				"bashls",
				"clangd",
				"cmake",
				"csharp_ls",
				"cssls",
				-- "diagnosticls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"fsautocomplete",
				"golangci_lint_ls",
				"gopls",
				"hls", -- haskell
				"html",
				"jdtls", -- java
				"jsonls",
				"kotlin_language_server",
				"lemminx", -- xml
				"lua_ls",
				"ocamllsp",
				"omnisharp",
				"pyright",
				"rnix", -- nix
				"rust_analyzer",
				"sqlls",
				"taplo", -- toml
				"terraformls",
				"texlab",
				"tflint",
				"tsserver",
				"vimls",
				"yamlls",
				"zls", -- zig
			},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								format = {
									enable = false,
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
				end,
			},
		})

		lsp_zero.configure("omnisharp", {
			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").handler,
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
				on_attach(client, bufnr)
			end,
			cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
			enable_import_completion = true,
			organize_imports_on_format = true,
		})

		lsp_zero.configure("yamlls", {
			settings = {
				yaml = {
					keyOrdering = false,
				},
			},
		})

		lsp_zero.configure("gopls", {
			settings = {
				gopls = {
					env = {
						GOFLAGS = "-tags=windows,linux,unittest,e2e",
					},
				},
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
