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
        -- { -- fold
        --   text = { builtin.foldfunc },
        --   click = "v:lua.ScFa",
        --   sign = { foldclosed = true },
        -- },
        { -- marks
          sign = {
            namespace = { "MarkSigns" },
            maxwidth = 2,
            auto = true,
          },
        },
        { -- diagnostics
          sign = {
            namespace = { "diagnostic" },
            maxwidth = 1,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        { -- testing
          sign = {
            namespace = { "neotest" },
            maxwidth = 1,
            auto = true,
          },
        },
        { -- debugging
          sign = {
            namespace = { "dap" },
            maxwidth = 1,
            auto = true,
          },
        },
        { -- line numbers
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        { -- git signs
          hl = "GitSigns",
          sign = {
            auto = false,
            wrap = true,
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
