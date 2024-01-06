return {
  "folke/trouble.nvim",
  enabled = false,
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleRefresh",
    "TroubleToggle",
  },
  keys = {
    {
      "<leader><leader>o",
      vim.cmd.TroubleToggle,
      desc = "Trouble",
    },
    -- {
    -- 	"gr",
    -- 	"<cmd>TroubleToggle lsp_references<CR>",
    -- 	desc = "List references",
    -- },
    -- {
    -- 	"gd",
    -- 	"<cmd>TroubleToggle lsp_definitions<CR>",
    -- 	desc = "Definition",
    -- },
    -- {
    -- 	"gt",
    -- 	"<cmd>TroubleToggle lsp_type_definitions<CR>",
    -- 	desc = "Type definition",
    -- },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
