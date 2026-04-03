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

vim.pack.add({
  "https://github.com/laytan/cloak.nvim",
})

require("cloak").setup({
  cloak_length = 32,
})
