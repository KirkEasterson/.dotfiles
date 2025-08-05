-- https://github.com/benlubas/.dotfiles/blob/31c725c38e7e77b5d19a94a336358c68c67d294c/nvim/after/ftplugin/qf.lua

local del_qf_item = function()
  local items = vim.fn.getqflist()
  local line = vim.fn.line(".")
  table.remove(items, line)
  vim.fn.setqflist(items, "r")
  vim.api.nvim_win_set_cursor(0, { line, 0 })
end

local util = require("util")
util.map("n", "dd", del_qf_item, { buffer = true, desc = "Remove entry from QF" })
util.map("v", "d", del_qf_item, { buffer = true, desc = "Remove entry from QF" })
