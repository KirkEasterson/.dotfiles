return {
	'williamboman/mason.nvim',
	event = "VimEnter",
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
