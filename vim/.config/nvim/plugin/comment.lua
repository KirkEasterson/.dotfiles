vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/folke/ts-comments.nvim",
  -- "https://github.com/nvim-treesitter/nvim-treesitter",
  -- "https://github.com/nvim-lua/plenary.nvim",

  "https://github.com/numToStr/Comment.nvim",
  "https://github.com/danymat/neogen",
  "https://github.com/folke/todo-comments.nvim",
})

require("Comment").setup()
require("Comment.ft").commonlisp = ";; %s"

require("todo-comments").setup({
  signs = false,
})

require("neogen").setup()

vim.keymap.set({ "n" }, "<leader>ng", function()
  require("neogen").generate()
end, { desc = "Generate docs" })
