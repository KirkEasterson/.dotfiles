return {
  "willothy/veil.nvim",
  enabled = false,
  lazy = false,
  priority = 998, -- 1 less than gruvbox
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    local builtin = require("veil.builtin")
    local art = require("art")

    local opts = {
      sections = {
        builtin.sections.animated({ art.neovim[5] }, {}),
        builtin.sections.animated({ art.ncc }, {}),
        builtin.sections.animated(art.frames_loading, {}),
        builtin.sections.buttons({
          {
            icon = "",
            text = "New file",
            shortcut = "n",
            callback = ":ene <BAR> startinsert <CR>",
          },
          {
            icon = "󰈞",
            text = "Find file",
            shortcut = "f",
            callback = ":Telescope find_files<CR>",
          },
          {
            icon = "󰦛",
            text = "Restore session",
            shortcut = "r",
            callback = ":SessionRestore<CR>",
          },
          {
            icon = "",
            text = "File tree",
            shortcut = "e",
            callback = ":NvimTreeOpen<CR>",
          },
          {
            icon = "󰅚",
            text = "Quit",
            shortcut = "q",
            callback = ":qa<CR>",
          },
        }),
      },
    }

    require("veil").setup(opts)
  end,
}
