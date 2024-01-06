return {
  "laytan/cloak.nvim",
  version = "*",
  cond = not vim.g.started_by_firenvim,
  ft = "dotenv",
  cmd = {
    "CloakEnable",
    "CloakDisable",
    "CloakToggle",
  },
  opts = {
    cloak_length = 32,
  },
  init = function()
    vim.filetype.add({
      extension = {
        env = "dotenv",
      },
      filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
        [".envrc"] = "dotenv",
        ["envrc"] = "dotenv",
      },
      pattern = {
        -- INFO: Match filenames like - ".env.example", ".env.local" and so on
        ["%.env%.[%w_.-]+"] = "dotenv",
        ["%.envrc%.[%w_.-]+"] = "dotenv",
      },
    })
  end,
}
