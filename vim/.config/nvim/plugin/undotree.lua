-- TODO: use native undotree
--
-- vim.cmd.packadd("nvim.undotree")
--
-- vim.keymap.set({ "n" }, "<leader>ut", function()
--   require("undotree").open()
-- end, { desc = "Undo tree" })

vim.pack.add({
  "https://github.com/mbbill/undotree",
})

vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_HighlightChangedText = 1
vim.g.undotree_HelpLine = 0
vim.g.undotree_TreeNodeShape = ""
vim.g.undotree_TreeVertShape = "│"
vim.g.undotree_TreeSplitShape = "╱"
vim.g.undotree_TreeReturnShape = "╱"

vim.keymap.set({ "n" }, "<leader>ut", function()
  vim.cmd.UndotreeToggle()
end, { desc = "Undo tree" })
