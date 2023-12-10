return {
	"brenton-leighton/multiple-cursors.nvim",
	keys = {
		{
			"<C-n>",
			vim.cmd.MultipleCursorsAddDown,
			mode = { "n", "i" },
		},
		{
			"<C-S-n>",
			vim.cmd.MultipleCursorsAddUp,
			mode = { "n", "i" },
		},
		{
			"<C-LeftMouse>",
			vim.cmd.MultipleCursorsMouseAddDelete,
			mode = { "n", "i" },
		},
	},
	opts = {
		disabled_default_key_maps = {
			{ { "n" }, "<C-j>" },
			{ { "n" }, "<C-k>" },
			{ { "n", "i" }, "<C-Down>" },
			{ { "n", "i" }, "<C-Up>" },
			{ { "n", "i" }, "<C-LeftMouse>" },
		},
	},
}
