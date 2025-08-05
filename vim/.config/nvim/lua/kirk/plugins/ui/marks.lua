return {
  "chentoast/marks.nvim",
  cmd = {
    "BookmarksList",
    "BookmarksListAll",
    "BookmarksQFList",
    "BookmarksQFListAll",
    "MarksListAll",
    "MarksListBuf",
    "MarksListGlobal",
    "MarksQFListAll",
    "MarksQFListBuf",
    "MarksQFListGlobal",
    "MarksToggleSigns",
  },
  keys = {
    {
      "m,",
      desc = "Set next available mark",
    },
    {
      "m;",
      desc = "Toggle next available mark",
    },
    {
      "m", -- Then and  a character. Visit mark by 'x or `x
      desc = "Add mark",
    },
    {
      "dm", -- And then a character
      desc = "Delete mark",
    },
    {
      "dm-",
      desc = "Delete all marks in current line",
    },
    {
      "dm<Space>",
      desc = "Delete all marks in current buffer",
    },
  },
  opts = {
    -- default_mappings = false,
    signs = true,
    -- builtin_marks = { "'", "<", ">", ".", }, -- TODO: change these
    cyclic = true,
  },
}
