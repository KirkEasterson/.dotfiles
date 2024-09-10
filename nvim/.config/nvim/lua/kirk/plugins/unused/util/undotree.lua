return {
  "mbbill/undotree",
  enabled = false,
  cmd = {
    "UndotreeFocus",
    "UndotreeHide",
    "UndotreeShow",
    "UndotreeToggle",
  },
  keys = {
    {
      "<leader>ut",
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = "Undo tree",
    },
  },
}
