return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
	},
	cond = not vim.g.started_by_firenvim,
	cmd = {
		"NullLsInfo",
		"NullLsLog",
	},
	event = "VeryLazy",
	config = function()
		null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				-- python
				-- null_ls.builtins.code_actions.pyright, -- TODO: find code_actions for python
				null_ls.builtins.diagnostics.pylint, -- TODO: experiment with ruff
				null_ls.builtins.formatting.autopep8,
				-- null_ls.builtins.formatting.black,

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
				null_ls.builtins.diagnostics.editorconfig_checker,

				-- golang
				-- null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.goimports,

				-- ocaml
				null_ls.builtins.formatting.ocamlformat,
			},
		})
	end

	,
}
