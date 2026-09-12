vim.schedule(function()
  vim.pack.add({
    -- ALREADY LOADED DEPENDENCIES
    -- "https://github.com/folke/ts-comments.nvim",
    -- "https://github.com/nvim-treesitter/nvim-treesitter",
    -- "https://github.com/nvim-lua/plenary.nvim",
    -- "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"

    { src = "https://github.com/numToStr/Comment.nvim", version = vim.version.range("*") },
    { src = "https://github.com/danymat/neogen", version = vim.version.range("*") },
    { src = "https://github.com/folke/todo-comments.nvim", version = vim.version.range("*") },
  })

  require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })

  require("todo-comments").setup({
    signs = false,
  })

  require("neogen").setup()

  vim.keymap.set({ "n" }, "<leader>ng", function()
    require("neogen").generate()
  end, { desc = "Generate docs" })
end)
