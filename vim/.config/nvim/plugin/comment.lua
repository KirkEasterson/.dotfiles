vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/folke/ts-comments.nvim",
    -- "https://github.com/nvim-treesitter/nvim-treesitter",
    -- "https://github.com/nvim-lua/plenary.nvim",

    { src = "https://github.com/numToStr/Comment.nvim", version = vim.version.range("*") },
    { src = "https://github.com/danymat/neogen", version = vim.version.range("*") },
    { src = "https://github.com/folke/todo-comments.nvim", version = vim.version.range("*") },
  })

  require("Comment").setup()

  require("todo-comments").setup({
    signs = false,
  })

  require("neogen").setup()

  vim.keymap.set({ "n" }, "<leader>ng", function()
    require("neogen").generate()
  end, { desc = "Generate docs" })
end)
