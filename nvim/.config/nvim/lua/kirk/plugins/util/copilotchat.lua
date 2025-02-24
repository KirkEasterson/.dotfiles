return {
  "CopilotC-Nvim/CopilotChat.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "github/copilot.vim",
    "MeanderingProgrammer/render-markdown.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = {
    "CopilotChat",
    "CopilotChatAgents",
    "CopilotChatClose",
    "CopilotChatDebugInfo",
    "CopilotChatLoad",
    "CopilotChatModels",
    "CopilotChatOpen",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatStop",
    "CopilotChatToggle",
  },
  build = "make tiktoken",
  keys = {
    {
      "<leader>cpt",
      function()
        require("CopilotChat").toggle()
      end,
      desc = "CopilotChat - toggle",
    },
    {
      "<leader>cpp",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - prompt actions",
      mode = { "n", "v" },
    },
  },
  opts = {
    highlight_headers = false,
    question_header = "  ",
    answer_header = "  ",
    error_header = "  ",
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-*",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.statuscolumn = ""
      end,
    })
  end,
}
