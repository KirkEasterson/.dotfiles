return {
  "kristijanhusak/vim-dadbod-ui",
  -- enabled = false,
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",

    -- "hrsh7th/nvim-cmp",
  },
  cmd = {
    -- dadbod
    "DB",

    -- dadbod-ui
    "DBUI",
    "DBUIAddConnection",
    "DBUIClose",
    "DBUIFindBuffer",
    "DBUIHideNotifications",
    "DBUILastQueryInfo",
    "DBUIRenameBuffer",
    "DBUIToggle",
  },
  keys = {
    -- TODO: use this and find more keys needed
    {
      "<leader>db",
      vim.cmd.DBUIToggle,
      desc = "Toggle database UI",
    },
  },
  config = function(_, _)
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_show_help = 0

    -- vim.api.nvim_create_autocmd({ "FileType" }, {
    --   pattern = { "sql", "mysql", "plsql" },
    --   callback = function()
    --     require("cmp").setup.buffer({
    --       sources = {
    --         { name = "vim-dadbod-completion" },
    --       },
    --     })
    --   end,
    --   desc = "Add completion for vim-dadbod",
    -- })
  end,
}
