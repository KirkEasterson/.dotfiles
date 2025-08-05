return {
  "laytan/cloak.nvim",
  ft = {
    "dotenv",
    "vault",
  },
  cmd = {
    "CloakEnable",
    "CloakDisable",
    "CloakToggle",
  },
  opts = {
    cloak_length = 32,
  },
  init = function()
    -- create dotenv filetype
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

    -- TODO: get this to work, and with yaml formatting
    -- create vault.yml filetype
    vim.filetype.add({
      extension = {
        env = "vault",
      },
      filename = {
        ["vault.yml"] = "vault",
      },
      pattern = {
        -- INFO: Match filenames like - "server_vault.yml", "db_vault.yml" and so on
        ["%vault.yaml%.[%w_.-]+"] = "vault",
      },
    })
  end,
}
