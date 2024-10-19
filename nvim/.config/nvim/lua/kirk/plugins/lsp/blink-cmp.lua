return {
  "saghen/blink.cmp",
  enabled = false,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    -- TODO:
    --  - add borders to cmp window
    --  - add sources from nvim-cmp
    nerd_font_variant = "normal",
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    windows = {
      autocomplete = {
        border = "rounded",
      },
      documentation = {
        border = "rounded",
      },
      signature_help = {
        border = "rounded",
      },
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    trigger = {
      signature_help = {
        enabled = true,
      },
    },
    keymap = {
      accept = "<C-y>",
      show_documentation = "<C-e>",
      hide_documentation = "<C-e>",
    },
  },
}
