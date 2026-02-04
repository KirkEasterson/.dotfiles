return {
  "olimorris/codecompanion.nvim",
  enable = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  opts = {
    strategies = {
      -- agent = {
      --   adapter = "ollama",
      --   model = "qwen2.5-coder:7b",
      -- },
      cmd = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },
      chat = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },
      inline = {
        adapter = "ollama",
        model = "qwen2.5-coder:7b",
      },
    },
    interactions = {
      background = {
        chat = {
          callbacks = {
            ["on_ready"] = {
              actions = {
                "interactions.background.builtin.chat_make_title",
              },
              -- Enable "on_ready" callback which contains the title generation action
              enabled = true,
            },
          },
          opts = {
            enabled = true,
          },
        },
      },
    },
  },
}
