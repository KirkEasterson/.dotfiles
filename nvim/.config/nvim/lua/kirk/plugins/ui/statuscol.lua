return {
  "luukvbaal/statuscol.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    -- "mfussenegger/nvim-dap",
    -- "kevinhwang91/nvim-ufo",
  },
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      ft_ignore = {
        "NeogitStatus",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "null-ls-info",
        "NvimTree",
        "packer",
        "scratch",
        "startify",
        "term",
        "terminal",
        "toggleterm",
        "trouble",
      },
      segments = {
        { -- marks
          sign = {
            namespace = { "MarkSigns" },
            auto = true,
          },
        },
        { -- diagnostics
          sign = {
            namespace = { "diagnostic" },
            auto = true,
          },
        },
        { -- testing
          sign = {
            namespace = { "neotest" },
            auto = true,
          },
        },
        { -- debugging
          sign = {
            namespace = { "dap" },
            auto = true,
          },
        },
        { -- line numbers
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        -- { -- fold
        --   text = { " ", builtin.foldfunc },
        --   click = "v:lua.ScFa",
        -- },
        { -- git signs
          sign = {
            auto = false,
            maxwidth = 1,
            colwidth = 1,
            fillchar = "│",
            fillcharhl = "CursorLineNr",
            namespace = { "gitsign" },
          },
          condition = { true },
        },
      },
    })
  end,
}
