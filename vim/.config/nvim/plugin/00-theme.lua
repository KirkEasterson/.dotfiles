vim.pack.add({
  "https://github.com/Tsuzat/NeoSolarized.nvim",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/NvChad/nvim-colorizer.lua",
  "https://github.com/nvim-zh/colorful-winsep.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
})

require("NeoSolarized").setup({
  terminal_colors = false,
})

vim.cmd.colorscheme("NeoSolarized")

local mini_icons = require("mini.icons")
mini_icons.setup()
mini_icons.mock_nvim_web_devicons()

require("colorizer").setup({
  user_default_options = {
    RGB = true, -- #f0f
    RRGGBB = true, -- #ff00ff
    names = false, -- Magenta
    RRGGBBAA = true, -- #ff00ffff
    rgb_fn = true, -- rgb(255, 0, 255) and rgba(255, 0, 255, 0.75)
    hsl_fn = true, -- hsl(300, 100%, 50%) and hsla(300, 100%, 50%, 0.75)
    mode = "background",
  },
})

vim.api.nvim_set_hl(0, "ColorfulWinSep", { bg = nil, fg = "yellow" })
require("colorful-winsep").setup({
  interval = 5,
  smooth = false,
  excluded_ft = {
    "snacks",
    "mason",
  },
  animate = {
    enabled = false,
  },
  indicator_for_2wins = {
    position = "center",
    symbols = {
      start_left = "",
      end_left = "",
      start_down = "",
      end_down = "",
      start_up = "",
      end_up = "",
      start_right = "",
      end_right = "",
    },
  },
})

require("ibl").setup({
  debounce = 50,
  indent = {
    char = "▏",
    tab_char = "▏",
    smart_indent_cap = true,
    repeat_linebreak = true, -- requires > nvim 0.10
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  scope = {
    enabled = false,
    char = "▍",
    show_start = true,
    show_end = true,
  },
  exclude = {
    filetypes = {
      "NvimTree",
      "TelescopePrompt",
      "TelescopeResults",
      "Trouble",
      "alpha",
      "checkhealth",
      "dashboard",
      "gitcommit",
      "help",
      "lspinfo",
      "man",
      "neogitstatus",
      "packer",
      "startify",
    },
  },
})
