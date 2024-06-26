return {
  "svermeulen/text-to-colorscheme",
  enabled = false,
  cmd = {
    "T2CAddContrast",
    "T2CAddSaturation",
    "T2CGenerate",
    "T2CResetChanges",
    "T2CSave",
    "T2CSelect",
    "T2ChuffleAccents",
  },
  config = function(_, _)
    local handle = io.popen("op read op://personal/OpenAI/password --no-newline")
    local openai_api_key = handle:read("*a")
    handle:close()

    local opts = {
      ai = {
        openai_api_key = openai_api_key,
        gpt_model = "gpt-3.5-turbo-0613",
      },
    }

    require("text-to-colorscheme").setup(opts)
    vim.cmd({
      cmd = "colorscheme",
      args = {
        "text-to-colorscheme",
      },
    })
  end,
}
