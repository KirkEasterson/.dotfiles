return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  branch = "main",
  lazy = false,
  version = false,
  opts = {
    select = {
      lookahead = true,
      keymaps = {
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
    move = {
      set_jumps = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter-textobjects").setup(opts)

    -- -- SELECT
    -- function
    vim.keymap.set({ "x", "o" }, "af", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
    end)

    -- class
    vim.keymap.set({ "x", "o" }, "ac", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ic", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
    end)

    -- scope
    vim.keymap.set({ "x", "o" }, "as", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
    end)

    -- -- MOVE
    -- dot repeat
    vim.keymap.set(
      { "n", "x", "o" },
      "f",
      require("nvim-treesitter-textobjects.repeatable_move").builtin_f_expr,
      { expr = true }
    )
    vim.keymap.set(
      { "n", "x", "o" },
      "F",
      require("nvim-treesitter-textobjects.repeatable_move").builtin_F_expr,
      { expr = true }
    )
    vim.keymap.set(
      { "n", "x", "o" },
      "t",
      require("nvim-treesitter-textobjects.repeatable_move").builtin_t_expr,
      { expr = true }
    )
    vim.keymap.set(
      { "n", "x", "o" },
      "T",
      require("nvim-treesitter-textobjects.repeatable_move").builtin_T_expr,
      { expr = true }
    )

    -- function
    vim.keymap.set({ "n", "x", "o" }, "[F", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]F", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
    end)

    -- class
    vim.keymap.set({ "n", "x", "o" }, "[C", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]C", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
    end)

    -- conditional
    vim.keymap.set({ "n", "x", "o" }, "[i", function()
      require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]i", function()
      require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
    end)

    -- loop
    vim.keymap.set({ "n", "x", "o" }, "]o", function()
      require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[o", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start({ "@loop.inner", "@loop.outer" }, "textobjects")
    end)
  end,
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
  end,
}
