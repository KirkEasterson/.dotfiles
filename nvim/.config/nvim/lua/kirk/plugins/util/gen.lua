return {
  "David-Kunz/gen.nvim",
  cond = not vim.g.started_by_firenvim,
  cmd = {
    "Gen",
  },
  keys = {
    {
      "<leader>\\",
      vim.cmd.Gen,
      desc = "Ollama",
      mode = { "n", "v" },
    },
  },
  config = function(_, opts)
    local gen = require("gen")

    gen.model = "orca-mini" -- default 'mistral:instruct'
    -- gen.container = 'ollama' -- if running in docker container
    -- gen.command = 'docker exec -it ollama ollama run $model $prompt'
  end,
}
