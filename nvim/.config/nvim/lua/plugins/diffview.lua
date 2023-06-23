return {
	'sindrets/diffview.nvim',
	enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	cmd = {
		'DiffviewClose',
		'DiffviewFileHistory',
		'DiffviewFocusFiles',
		'DiffviewOpen',
		'DiffviewRefresh',
		'DiffviewToggleFiles',
	},
	config = true,
}
