return {
	'sindrets/winshift.nvim',
	cmd = {
		"WinShift",
	},
	keys = {
		{
			"<leader><leader>s",
			"<Cmd>WinShift<CR>",
			desc = "Window move mode",
		},
		{
			"<C-S-h>",
			"<Cmd>WinShift left<CR>",
			desc = "Move window left",
		},
		{
			"<C-S-j>",
			"<Cmd>WinShift down<CR>",
			desc = "Move window down",
		},
		{
			"<C-S-k>",
			"<Cmd>WinShift up<CR>",
			desc = "Move window up",
		},
		{
			"<C-S-l>",
			"<Cmd>WinShift right<CR>",
			desc = "Move window right",
		},
	},
	opts = {},
}
