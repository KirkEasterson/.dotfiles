return {
  "romgrk/barbar.nvim",
  enabled = false,
  dependencies = {
    "echasnovski/mini.icons",
    "lewis6991/gitsigns.nvim",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  cmd = {
    "BufferOrderByBufferNumber",
    "BufferOrderByDirectory",
    "BufferOrderByLanguage",
    "BufferOrderByName",
    "BufferOrderByWindowNumber",
  },
  opts = {
    animation = false,
    -- auto_hide = true,
    maximum_padding = 1,
    minimum_padding = 1,
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  -- config = function(_, opts)
  --   local palette = require("gruvbox").palette
  --
  --   vim.cmd("highlight BufferCurrent guibg=" .. palette.bg0 .. " guifg=none")
  --   vim.cmd("highlight BufferCurrentSign guibg=" .. palette.bg0 .. " guifg=none")
  --   vim.cmd("highlight BufferVisible guibg=" .. palette.bg0 .. " guifg=" .. palette.neutral_yellow)
  --   vim.cmd("highlight BufferVisibleSign guibg=" .. palette.bg0 .. " guifg=" .. palette.neutral_yellow)
  --   vim.cmd("highlight BufferInactive guibg=" .. palette.bg0 .. " guifg=" .. palette.gray)
  --   vim.cmd("highlight BufferInactiveSign guibg=" .. palette.bg0 .. " guifg=" .. palette.gray)
  -- end,
}
