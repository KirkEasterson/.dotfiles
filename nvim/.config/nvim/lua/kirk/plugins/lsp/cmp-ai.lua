-- TODO: figure out how I don't need HF_API_KEY
return {
  "tzachar/cmp-ai",
  enabled = false,
  main = "cmp_ai.config",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    max_lines = 100,
    provider = "Ollama",
    provider_options = {
      model = "codellama:7b-code",
    },
    notify = false,
    run_on_every_keystroke = true,
  },
}
