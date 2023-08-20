return {
	'williamboman/mason.nvim',
	cond = not vim.g.started_by_firenvim,
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonLog",
		"MasonUpdate",
	},
	opts = {
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			},
		},
	},
}
