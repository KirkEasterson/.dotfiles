return {
  "saghen/blink.cmp",
  -- enabled = false,
  lazy = false,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    appearance = {
      nerd_font_variant = "mono",
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
      providers = {
        buffer = {
          max_items = 3,
          min_keyword_length = 5,
        },
        lsp = {},
        path = {},
        snippets = {
          max_items = 2,
        },
      },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      documentation = {
        auto_show = true,
      },
      list = {
        max_items = 30,
      },
      menu = {
        draw = {
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
    },
  },
}
