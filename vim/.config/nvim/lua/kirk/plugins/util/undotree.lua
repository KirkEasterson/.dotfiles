return {
  "mbbill/undotree",
  cmd = {
    "UndotreeFocus",
    "UndotreeHide",
    "UndotreeShow",
    "UndotreeToggle",
  },
  keys = {
    {
      "<leader>ut",
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = "Undo tree",
    },
  },
  init = function()
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_HighlightChangedText = 1
    vim.g.undotree_HelpLine = 0
    vim.g.undotree_TreeNodeShape = ""
    vim.g.undotree_TreeVertShape = "│"
    vim.g.undotree_TreeSplitShape = "╱"
    vim.g.undotree_TreeReturnShape = "╱"
  end,
}
