-- hacky fix for terraform files
vim.filetype.add({
  extension = {
    tf = "terraform",
    gotmpl = "gotmpl",
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
    [".envrc"] = "dotenv",
    ["envrc"] = "dotenv",
    ["vault.yml"] = "vault",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "dotenv",
    ["%.envrc%.[%w_.-]+"] = "dotenv",
    ["%vault.yaml%.[%w_.-]+"] = "vault",
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
