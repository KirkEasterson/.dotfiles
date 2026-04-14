local group = vim.api.nvim_create_augroup("LuasnipSetup", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  desc = "Build luasnip",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "LuaSnip" and (kind == "update" or kind == "install") then
      -- TODO: check that this is correct
      vim.cmd("make install_jsregexp")
    end
  end,
})

vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/Bilal2453/luvit-meta",
  "https://github.com/gonstoll/wezterm-types",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
  "https://github.com/L3MON4D3/LuaSnip",
})

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono",
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = {
      "lazydev",
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
      lsp = {
        min_keyword_length = 0,
      },
      path = {
        min_keyword_length = 1,
      },
      snippets = {
        max_items = 5,
        min_keyword_length = 2,
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
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
})
