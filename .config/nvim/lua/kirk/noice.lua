-- require('notify').setup({
-- 	background_color = '#000000',
-- })

require("noice").setup({
	cmdline = {
		view = "cmdline",
	},
	notify = {
		enabled = false,
	},
	lsp_progress = {
		enabled = false,
	},
})
