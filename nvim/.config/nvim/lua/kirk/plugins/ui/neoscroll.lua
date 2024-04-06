return {
  "karb94/neoscroll.nvim",
  enabled = false,
  keys = {
    "<C-b>",
    "<C-d>",
    "<C-e>",
    "<C-f>",
    "<C-u>",
    "<C-y>",
    "zb",
    "zt",
    "zz",
    -- "<ScrollWheelDown>",
    -- "<ScrollWheelUp>",
  },
  opts = {
    -- https://github.com/karb94/neoscroll.nvim/issues/80
    -- call WinScrolled and CursorMoved only once
    pre_hook = function()
      vim.opt.eventignore:append({
        "WinScrolled",
        "CursorMoved",
      })
    end,
    post_hook = function()
      vim.opt.eventignore:remove({
        "WinScrolled",
        "CursorMoved",
      })
    end,
  },
}
