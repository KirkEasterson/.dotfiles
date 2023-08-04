return {
	"chentoast/marks.nvim",
	cmd = {
		"MarksToggleSigns",
		"MarksListBuf",
		"MarksListGlobal",
		"MarksListAll",
		"BookmarksList",
		"BookmarksListAll",
		"MarksQFListBuf",
		"MarksQFListGlobal",
		"MarksQFListAll",
		"MarksQFList",
		"MarksQFListAll",
	},
	keys = {
		{
			'<leader>mt',
			'<Cmd>MarksToggleSigns<CR>',
			desc = "Toggle marks",
		},
	},
	opts = {
		default_mappings = false,
	},
}
