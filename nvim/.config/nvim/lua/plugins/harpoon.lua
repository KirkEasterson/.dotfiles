return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>ha",
			function () require("harpoon.mark").add_file() end,
			desc = "Add harpoon mark",
		},
		{
			"<leader>hq",
			function () require("harpoon.ui").toggle_quick_menu() end,
			desc = "Toggle harpoon UI",
		},
		{
			"<leader>h1",
			function () require("harpoon.ui").nav_file(1) end,
			desc = "Harpoon file 1",
		},
		{
			"<leader>h2",
			function () require("harpoon.ui").nav_file(2) end,
			desc = "Harpoon file 2",
		},
		{
			"<leader>h3",
			function () require("harpoon.ui").nav_file(3) end,
			desc = "Harpoon file 3",
		},
		{
			"<leader>h4",
			function () require("harpoon.ui").nav_file(4) end,
			desc = "Harpoon file 4",
		},
		{
			"<leader>hm",
			"<Cmd>Telescope harpoon marks<CR>",
			desc = "Harpoon marks",
		},
	},
	opts = {},
	config = function ()
		require("harpoon").setup(opts)
		require("telescope").load_extension("harpoon")
	end,
}
