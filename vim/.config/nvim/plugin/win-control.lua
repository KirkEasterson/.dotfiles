vim.pack.add({
  "https://github.com/aserowy/tmux.nvim",
  "https://github.com/sindrets/winshift.nvim",
})

require("tmux").setup({
  copy_sync = {
    enable = false,
  },
  resize = {
    resize_step_x = 8,
    resize_step_y = 4,
  },
})

require("winshift").setup()

vim.keymap.set({ "n" }, "<C-h>", function()
  require("tmux").move_left()
end, { desc = "Move focus left" })
vim.keymap.set({ "n" }, "<C-j>", function()
  require("tmux").move_bottom()
end, { desc = "Move focus down" })
vim.keymap.set({ "n" }, "<C-k>", function()
  require("tmux").move_top()
end, { desc = "Move focus up" })
vim.keymap.set({ "n" }, "<C-l>", function()
  require("tmux").move_right()
end, { desc = "Move focus right" })

vim.keymap.set({ "n" }, "<M-h>", function()
  require("tmux").resize_left()
end, { desc = "Resize left" })
vim.keymap.set({ "n" }, "<M-j>", function()
  require("tmux").resize_bottom()
end, { desc = "Resize down" })
vim.keymap.set({ "n" }, "<M-k>", function()
  require("tmux").resize_top()
end, { desc = "Resize up" })
vim.keymap.set({ "n" }, "<M-l>", function()
  require("tmux").resize_right()
end, { desc = "Resize right" })

vim.keymap.set({ "n" }, "<C-S-h>", function()
  require("winshift").cmd_winshift("left")
end, { desc = "Move window left" })
vim.keymap.set({ "n" }, "<C-S-j>", function()
  require("winshift").cmd_winshift("down")
end, { desc = "Move window down" })
vim.keymap.set({ "n" }, "<C-S-k>", function()
  require("winshift").cmd_winshift("up")
end, { desc = "Move window up" })
vim.keymap.set({ "n" }, "<C-S-l>", function()
  require("winshift").cmd_winshift("right")
end, { desc = "Move window right" })
