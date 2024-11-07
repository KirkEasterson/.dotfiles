return {
  "saghen/blink.cmp",
  enabled = false,
  lazy = false, -- lazy loading handled internally
  version = "v0.3", -- TODO: upgrade to v5
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    nerd_font_variant = "mono",
    windows = {
      autocomplete = {
        border = "rounded",
        draw = function(ctx)
          return {
            " ",
            {
              ctx.item.label,
              fill = true,
              hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
              max_width = 45,
            },
            " ",
            {
              ctx.kind_icon,
              ctx.icon_gap,
              "[" .. ctx.kind .. "]",
              hl_group = "BlinkCmpKind" .. ctx.kind,
            },
          }
        end,
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
    prebuiltBinaries = {
      forceVersion = true,
    },
  },
}
