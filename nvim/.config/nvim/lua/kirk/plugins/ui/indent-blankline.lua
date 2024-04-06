return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VimEnter",
  cmd = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
  },
  opts = {
    indent = {
      char = "▏",
      smart_indent_cap = true,
      repeat_linebreak = true, -- requires > nvim 0.10
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = {
      enabled = false,
      char = "▏", -- thinnest line possible
      show_start = false,
      show_end = false,
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
        "man",
        "neogitstatus",
        "packer",
        "startify",
      },
    },
  },
}
