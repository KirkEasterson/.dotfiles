return {
	'famiu/bufdelete.nvim',
	keys = {
		{ '<C-w>', function() require('bufdelete').bufdelete(0, true) end }
	},
	config = false,
}
