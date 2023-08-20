return {
	"chentoast/marks.nvim",
	cond = not vim.g.started_by_firenvim,
	-- event = "VimEnter",
	event = "BufEnter",
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
	opts = {
		-- default_mappings = false,
		signs = true,
		-- builtin_marks = { "'", "<", ">", ".", }, -- TODO: change these
	},
}
