require('kirk.lsp.on_attach')
require('rust-tools').setup({
	server = {
		on_attach = on_attach,
	}
})

--[[ require('lspconfig').rls.setup {
	server = {
		on_attach = on_attach,
	},
	settings = {
		rust = {
			unstable_features = true,
			build_on_save = false,
			all_features = true,
		},
	},
	cmd = { "rustup", "run", "nightly", "rls" },
} ]]
