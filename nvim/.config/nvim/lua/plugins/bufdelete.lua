return {
	'famiu/bufdelete.nvim',
	enabled = false, -- TODO: replace with a simple binding
	cmd = {
		"Bdelete",
		"Bwipeout",
	},
	keys = {
		{
			'<C-w>',
			function() require('bufdelete').bufdelete(0, false) end,
			desc = "Delete current buffer",
		}
	},
}
