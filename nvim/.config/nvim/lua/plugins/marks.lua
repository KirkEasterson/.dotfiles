return {
	"chentoast/marks.nvim",
	cmd = {
		"BookmarksList",
		"BookmarksListAll",
		"MarksListAll",
		"MarksListBuf",
		"MarksListGlobal",
		"MarksQFList",
		"MarksQFListAll",
		"MarksQFListAll",
		"MarksQFListBuf",
		"MarksQFListGlobal",
		"MarksToggleSigns",
	},
	keys = {
		{
			'<leader>mt',
			'<Cmd>MarksToggleSigns<CR>',
			desc = "Toggle marks",
		},
		{
			'm',
			function()
				require('marks').set_next()
			end,
			desc = "Add mark",
		},
		{
			'<leader>mrl',
			function()
				require('marks').delete_line()
			end,
			desc = "Delete line marks",
		},
		{
			'<leader>mrb',
			function()
				require('marks').delete_buf()
			end,
			desc = "Delete buffer marks",
		},
		{
			'm]',
			function()
				require('marks').next()
			end,
			desc = "Next mark",
		},
		{
			'm[',
			function()
				require('marks').prev()
			end,
			desc = "Previous mark",
		},
	},
	opts = {
		default_mappings = false,
		signs = true,
		builtin_marks = { "'", "<", ">", "." }, -- TODO: change these
	},
}
