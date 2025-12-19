-- TODO. replace with https://github.com/nvim-treesitter/nvim-treesitter-locals
return {
  "nvim-treesitter/nvim-treesitter-refactor",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  main = "nvim-treesitter.configs",
  lazy = false,
  opts = {
    refactor = {
      highlight_current_scope = {
        enable = false,
      },
      highlight_definitions = {
        enable = true,
        clear_on_cursor_move = false,
      },
      -- smart_rename = {
      -- 	enable = true,
      -- 	keymaps = {
      -- 		smart_rename = "<leader>rn",
      -- 	},
      -- },
    },
  },
}
