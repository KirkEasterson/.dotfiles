return {
  "luukvbaal/statuscol.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "chentoast/marks.nvim",
    -- "mfussenegger/nvim-dap",
    -- "kevinhwang91/nvim-ufo",
  },
  event = "UIEnter",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      ft_ignore = {
        "NeogitStatus",
        "NvimTree",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "null-ls-info",
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
            name = { ".*" },
            maxwidth = 2,
            colwidth = 1,
            auto = true,
          },
        },
        { -- diagnostics
          sign = {
            namespace = { "diagnostic" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        { -- testing
          sign = {
            namespace = { "neotest" },
            name = { ".*" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
        },
        { -- debugging
          sign = {
            namespace = { "dap" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
        },
        { -- line numbers
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        { -- fold
          text = { " ", builtin.foldfunc },
          click = "v:lua.ScFa",
          sign = { foldclosed = true },
        },
        { -- git signs
          hl = "GitSigns",
          sign = {
            wrap = true,
            maxwidth = 1,
            colwidth = 1,
            fillchar = "┃",
            fillcharhl = "",
            namespace = { "gitsign" },
          },
        },
      },
    })
  end,
}
