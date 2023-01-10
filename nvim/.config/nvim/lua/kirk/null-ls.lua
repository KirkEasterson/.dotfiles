local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		--
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
	},
	on_attach = on_attach,
})
