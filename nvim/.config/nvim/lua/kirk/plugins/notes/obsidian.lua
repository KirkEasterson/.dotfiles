return {
  "epwalsh/obsidian.nvim",
  enabled = false,
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/obsidian/vaults/*/**.md",
  },
  cmd = {
    "ObsidianBacklinks", -- location list of refs to current buffer
    "ObsidianFollowLink", -- follow link under cursor
    "ObsidianLink", -- create link from selection
    "ObsidianLinkNew", -- create new note with link from selection
    "ObsidianNew", -- new note
    "ObsidianOpen", -- open in obsidian app
    "ObsidianPasteImg", -- paste image from clipboard
    "ObsidianQuickSwitch", -- switch note within vault
    "ObsidianRename", -- rename current note or reference under cursor
    "ObsidianSearch", -- search contents of notes
    "ObsidianTemplate", -- insert termplate from templates
    "ObsidianToday", -- today's note
    "ObsidianTomorrow", -- tomorrow's note
    "ObsidianWorkspace", -- switch workspace
    "ObsidianYesterday", -- yesterday's note
  },
  keys = {
    {
      "<leader>bb",
      vim.cmd.ObsidianToday,
      desc = "Obsidian today",
    },
    {
      "<leader>bf",
      vim.cmd.ObsidianQuickSwitch,
      desc = "Obsidian notes",
    },
    {
      "<leader>bs",
      vim.cmd.ObsidianSearch,
      desc = "Search obsidian notes",
    },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian/vaults/personal/",
      },
      {
        name = "work",
        path = "~/Documents/obsidian/vaults/work/",
      },
    },
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M:%s",
    },
  },
  config = function(_, opts)
    os.execute("mkdir -p ~/Documents/obsidian/vaults/personal/templates 2>&1 /dev/null")
    os.execute("mkdir -p ~/Documents/obsidian/vaults/work/templates 2>&1 /dev/null")
    require("obsidian").setup(opts)
  end,
}
