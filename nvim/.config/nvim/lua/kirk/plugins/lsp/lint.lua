return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			csharp = { "dotenv_linter" },
			fsharp = { "dotenv_linter" },
		}

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
			"TextChanged",
		}, {
			group = vim.api.nvim_create_augroup("lint", {
				clear = true,
			}),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
