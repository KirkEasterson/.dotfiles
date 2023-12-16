return {
	"stevearc/conform.nvim",
	cmd = {
		"ConformInfo",
	},
	keys = {
		{
			"<leader>fc",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				})
			end,
			desc = "Format",
			mode = { "n", "x", "v" }, -- TODO: get range formatting to work
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { "prettier" },
			go = { { "gofmt", "gofumpt" }, "golines", "goimports" },
			html = { "prettier" },
			javascript = { { "prettierd", "prettier" }, "eslint_d" },
			javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { { "markdownlint", "prettier" } },
			ocaml = { "ocamlformat" },
			python = { "black" },
			rust = { "rustfmt" },
			svelte = { "prettier" },
			terraform = { "tflint" },
			typescript = { { "prettierd", "prettier" }, "eslint_d" },
			typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			yaml = { { "yamlfmt", "prettier" } },
			zig = { "zigfmt" },
		},
	},
}
