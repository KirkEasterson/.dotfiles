return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "ellisonleao/gruvbox.nvim",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    disabled_filetypes = {
      statusline = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neogitstatus",
        "null-ls-info",
        "nvimtree",
        "packer",
        "scratch",
        "startify",
        "terminal",
        "toggleterm",
        "trouble",
      },
    },
    options = {
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      refresh = {
        statusline = 50,
        -- tabline = 50,
        -- winbar = 50,
      },
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          color = {
            gui = "bold",
            fg = require("gruvbox").palette.neutral_yellow,
          },
        },
        "diagnostics",
        {
          "branch",
          color = {
            fg = require("gruvbox").palette.neutral_aqua,
          },
        },
        "diff",
      },
      lualine_x = {
        "overseer",
        "grapple",
        {
          "macro-recording",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end
            return "recording @" .. reg
          end,
        },
      },
    },
  },
}
