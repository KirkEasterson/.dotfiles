return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  main = "nvim-treesitter.configs",
  event = "VeryLazy",
  opts = {
    textobjects = {
      move = {
        enable = false,
      },
      swap = {
        enable = false,
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },
      select = {
        enable = true,
        disable = {
          "zig",
        },
        lookahead = true,
        keymaps = {
          -- this cause issues with rust and zig
          --  - https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/513
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ak"] = "@block.outer",
          ["ik"] = "@block.inner",
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = false,
      },
    },
  },
}
