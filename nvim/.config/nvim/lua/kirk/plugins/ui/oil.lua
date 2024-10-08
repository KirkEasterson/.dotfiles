return {
  "stevearc/oil.nvim",
  enabled = false,
  dependencies = {
    "echasnovski/mini.icons",
  },
  cmd = {
    "Oil",
  },
  keys = {
    {
      "<leader>i",
      vim.cmd.Oil,
      desc = "Oil",
    },
  },
  opts = {
    -- TODO: close oil after selecting file (https://github.com/stevearc/oil.nvim/issues/53)
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
