return {
  "jackMort/ChatGPT.nvim",
  cond = vim.g.started_by_firenvim,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTCompleteCode",
    "ChatGPTEditWithInstructions",
    "ChatGPTRun",
  },
  opts = {
    api_key_cmd = "op read op://personal/OpenAI/password --no-newline",
    chat = {
      welcome_message = "",
    },
  },
}
