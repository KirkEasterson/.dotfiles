local util = require("util")

util.map("n", "<leader><leader>w", "<cmd>WinShift<CR>")
util.map("n", "<leader><leader>s", "<cmd>WinShift swap<CR>")
util.map("n", "<leader><leader>h", "<cmd>WinShift left<CR>")
util.map("n", "<leader><leader>j", "<cmd>WinShift down<CR>")
util.map("n", "<leader><leader>k", "<cmd>WinShift up<CR>")
util.map("n", "<leader><leader>l", "<cmd>WinShift right<CR>")

require("winshift").setup({})
