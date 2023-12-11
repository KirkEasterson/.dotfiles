return {
	"stevearc/conform.nvim",
	enabled = false,
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
			mode = { "n", "v" },
		},
	},
	opts = {
		formatters_by_ft = {
			-- python = { "isort", "black" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			svelte = { "prettier" },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			yaml = { "prettier" },
		},
	},
}
