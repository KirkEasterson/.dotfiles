return {
  "smjonas/inc-rename.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
  },
  enabled = false, -- replaced by lspsaga
  cmd = "IncRename",
  keys = {
    {
      "<leader>rn",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "Rename",
    },
  },
  opts = {
    input_buffer_type = "dressing",
  },
}
