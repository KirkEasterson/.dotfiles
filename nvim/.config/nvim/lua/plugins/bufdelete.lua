return {
	'famiu/bufdelete.nvim',
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
