return {
  "folke/noice.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  },
  cmd = {
    "Noice",
    "NoiceDisable",
    "NoiceLast",
  },
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
    notify = {
      enabled = false,
    },
    lsp = {
      progress = {
        enabled = false,
      },
      -- hover = {
      --   enabled = false,
      -- },
      -- signature = {
      --   enabled = false,
      -- },
      -- message = {
      --   enabled = false,
      -- },
      override = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = false,
      lsp_doc_border = true,
    },
    routes = {
      {
        -- https://github.com/folke/noice.nvim/issues/568#issuecomment-1673907587
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
          },
        },
        opts = { skip = true },
      },
    },
  },
  init = function()
    vim.opt.lazyredraw = false
  end,
}
