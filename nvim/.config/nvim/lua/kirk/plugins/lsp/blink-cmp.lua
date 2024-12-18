return {
  "saghen/blink.cmp",
  -- enabled = false,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    appearance = {
      nerd_font_variant = "mono",
      use_nvim_cmp_as_default = true,
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },
    completion = {
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        border = "rounded",
        draw = {
          align_to_component = "none",
          treesitter = { "lsp" },
          columns = {
            {
              "label",
              "label_description",
              gap = 1,
            },
            {
              "kind_icon",
              "kind",
              gap = 1,
            },
            {
              "open_bracket",
              "source_name",
              "close_bracket",
            },
          },
          components = {
            open_bracket = {
              text = function()
                return "["
              end,
              highlight = function()
                return "BlinkCmpSource"
              end,
            },
            close_bracket = {
              text = function()
                return "]"
              end,
              highlight = function()
                return "BlinkCmpSource"
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
      fuzzy = {
        prebuiltBinaries = {
          forceVersion = true,
        },
      },
    },
  },
}
