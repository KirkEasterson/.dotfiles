return {
  "saghen/blink.cmp",
  -- enabled = false,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    enabled = function()
      if vim.b.completion == false then
        return false
      end

      if vim.bo.buftype == "prompt" then
        return false
      end

      -- if vim.fn.mode() == "c" then
      --   return false
      -- end

      if vim.fn.reg_executing() ~= "" then
        return false
      end

      return true
    end,
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
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      menu = {
        border = "rounded",
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
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}
