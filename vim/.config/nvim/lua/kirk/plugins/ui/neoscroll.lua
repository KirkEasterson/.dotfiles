return {
  "karb94/neoscroll.nvim",
  -- enabled = false,
  event = "VeryLazy",
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
    legacy_computing_symbols_support = true,
    ignore_events = {
      "WinScrolled",
      "CursorMoved",
    },
  },
  config = function(_, opts)
    require("neoscroll").setup(opts)

    local animation_time = "50"
    require("neoscroll.config").set_mappings({
      ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", animation_time } },
      ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", animation_time } },
      ["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", animation_time } },
      ["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", animation_time } },
      ["<C-y>"] = { "scroll", { "-0.10", "false", animation_time } },
      ["<C-e>"] = { "scroll", { "0.10", "false", animation_time } },
      ["zt"] = { "zt", { animation_time } },
      ["zz"] = { "zz", { animation_time } },
      ["zb"] = { "zb", { animation_time } },
      -- ["G"] = { "scroll", { "10000", "true", animation_time } },
      -- ["gg"] = { "scroll", { "-10000", "true", animation_time } },
    })
  end,
}
