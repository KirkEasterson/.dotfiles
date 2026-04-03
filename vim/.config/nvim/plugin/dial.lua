vim.pack.add({
  "https://github.com/monaqa/dial.nvim",
})

local augend = require("dial.augend")
require("dial.config").augends:register_group({
  default = {
    augend.integer.alias.decimal_int,
    augend.constant.alias.bool,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%d/%m/%Y"],
    augend.date.alias["%d-%m-%Y"],
  },
})

vim.keymap.set({ "n" }, "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end, { desc = "Increment" })
vim.keymap.set({ "n" }, "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end, { desc = "Decrement" })
vim.keymap.set({ "v" }, "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
  vim.api.nvim_feedkeys("gv", "n", true)
end, { desc = "Increment" })
vim.keymap.set({ "v" }, "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
  vim.api.nvim_feedkeys("gv", "n", true)
end, { desc = "Decrement" })
