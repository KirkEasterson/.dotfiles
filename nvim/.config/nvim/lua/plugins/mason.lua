return {
	'williamboman/mason.nvim',
	event = "VimEnter",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	}
}
