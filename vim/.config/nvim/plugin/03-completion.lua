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
  "https://github.com/Bilal2453/luvit-meta",
  "https://github.com/gonstoll/wezterm-types",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/L3MON4D3/LuaSnip",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "wezterm-types", mods = { "wezterm" } },
    { path = "nvim-dap-ui" },
  },
})

require("luasnip").setup()
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono",
  },
  signature = {
    enabled = true,
  },
  snippets = {
    preset = "luasnip",
  },
  sources = {
    default = {
      "lazydev",
      "lsp",
      "snippets",
      "path",
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
  keymap = {
    ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-p"] = { "select_prev", "fallback" },
    ["<C-n"] = { "select_next", "fallback" },
    ["<C-y>"] = { "select_and_accept", "fallback" },

    -- disable mappings
    ["<Tab>"] = false,
    ["<S-Tab>"] = false,
  },
})

-- disable default snippet bindings
vim.keymap.del({ "s", "i" }, "<Tab>")
vim.keymap.del({ "s", "i" }, "<S-Tab>")

local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-t>", function()
  ls.expand()
end, { desc = "Snippet - expand" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  ls.jump(1)
end, { desc = "Snippet - next" })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  ls.jump(-1)
end, { desc = "Snippet - prev" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "Snippet - next choice" })
vim.keymap.set({ "i", "s" }, "<C-S-k>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { desc = "Snippet - prev choice" })
