return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  cmd = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
  },
  opts = {
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
  },
}
