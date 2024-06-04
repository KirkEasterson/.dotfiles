return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  version = false,
  dependencies = {
    "onsails/lspkind.nvim",
    "nvim-lua/plenary.nvim",

    -- lsp
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",

    -- system
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "FelipeLema/cmp-async-path",

    -- misc
    "hrsh7th/cmp-calc",
    "uga-rosa/cmp-dictionary",
    "f3fora/cmp-spell",
    "tzachar/cmp-ai",
    "SergioRibera/cmp-dotenv",

    -- lang specific
    "hrsh7th/cmp-nvim-lua",
    "David-Kunz/cmp-npm",
    "folke/lazydev.nvim",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- Git
    "petertriho/cmp-git",
    "davidsierradz/cmp-conventionalcommits",
  },
  config = function(_, opts)
    require("cmp_git").setup({})

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      view = {
        entries = {
          follow_cursor = true,
        },
      },
      formatting = {
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "…",
            menu = {
              async_path = "[Path]",
              buffer = "[Buffer]",
              calc = "[Calc]",
              dictionary = "[Dictionary]",
              latex_symbols = "[Latex]",
              luasnip = "[LuaSnip]",
              npm = "[npm]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              spell = "[Spell]",
            },
          })(entry, vim_item)

          -- -- TODO: icon on left side https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu
          -- local strings = vim.split(kind.kind, "%s", { trimempty = true })
          -- print('1111111111')
          -- print(tprint(kind))
          -- kind.kind = " " .. (strings[1] or "") .. " "
          -- kind.menu = "    (" .. (strings[2] or "") .. ")"
          -- print('2222222222')
          -- print(tprint(kind))

          return kind
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "lazydev", keyword_length = 1, group_index = 0 },
        { name = "luasnip", keyword_length = 1 },
        -- { name = "cmp_ai", keyword_length = 1 },
        { name = "async_path", keyword_length = 1 },
        { name = "dotenv", keyword_length = 3 },
        { name = "calc", keyword_length = 3 },
        { name = "npm", keyword_length = 4 },
        { name = "dictionary", keyword_length = 3 },
        { name = "spell", keyword_length = 3 },
        -- { name = 'copilot', keyword_length = 3 },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        native_menu = false,
        ghost_text = false,
      },
    })

    cmp.setup.filetype({ "gitcommit", "NeogitCommitMessage" }, {
      sources = cmp.config.sources({
        { name = "git" },
        { name = "conventionalcommits" },
        { name = "path" },
        { name = "calc" },
        { name = "spell" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
  end,
}
