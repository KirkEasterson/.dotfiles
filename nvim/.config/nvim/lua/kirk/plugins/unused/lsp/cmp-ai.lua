-- TODO: figure out how I don't need HF_API_KEY
return {
  "tzachar/cmp-ai",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  main = "cmp_ai.config",
  opts = {
    max_lines = 100,
    provider = "Ollama",
    provider_options = {
      model = "codellama:7b-code",
    },
    run_on_every_keystroke = true,
    notify = true,
    notify_callback = function(msg)
      vim.notify(msg)
    end,
  },
  -- config = function(_, opts)
  --   vim.fn.setenv("HF_API_KEY", "")
  --   require("cmp_ai.config"):setup(opts)
  --   -- t
  -- end,
}
