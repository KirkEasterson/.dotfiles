vim.pack.add({
  "https://github.com/tamton-aquib/duck.nvim",
})

vim.keymap.set({ "n" }, "<leader>dh", function()
  require("duck").hatch("🪳")
end, { desc = "Create bug" })
vim.keymap.set({ "n" }, "<leader>dc", function()
  require("duck").cook()
end, { desc = "Squash bug" })
