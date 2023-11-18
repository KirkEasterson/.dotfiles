return {
	"brenton-leighton/multiple-cursors.nvim",
	keys = {
		{
			"<C-n>",
			"<Cmd>MultipleCursorsAddDown<CR>",
			mode = { "n", "i" }
		},
		{
			"<C-S-n>",
			"<Cmd>MultipleCursorsAddUp<CR>",
			mode = { "n", "i" }
		},
		{
			"<C-LeftMouse>",
			"<Cmd>MultipleCursorsMouseAddDelete<CR>",
			mode = { "n", "i" }
		},
	},
	opts = {
		disabled_default_key_maps = {
			{ { "n" },      "<C-j>" },
			{ { "n" },      "<C-k>" },
			{ { "n", "i" }, "<C-Down>" },
			{ { "n", "i" }, "<C-Up>" },
			{ { "n", "i" }, "<C-LeftMouse>" },
		},
	},
}
