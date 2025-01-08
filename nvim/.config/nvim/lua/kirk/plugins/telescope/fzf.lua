return {
  "ibhagwan/fzf-lua",
  -- enabled = false,
  dependencies = {
    "echasnovski/mini.icons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  cmd = "FzfLua",
  keys = {
    -- fzf file helpers
    {
      "<leader>ff",
      function()
        require("fzf-lua").files({
          resume = true,
          winopts = {
            split = "belowright new",
            preview = {
              hidden = "hidden",
            },
          },
        })
      end,
      desc = "Find files",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers({
          resume = true,
          winopts = {
            split = "belowright new",
            preview = {
              hidden = "hidden",
            },
          },
        })
      end,
      desc = "Search buffers",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep_native({ resume = true })
      end,
      desc = "Project search",
    },
    {
      "<leader>fG",
      function()
        require("fzf-lua").grep_cword({ resume = true })
      end,
      mode = { "n" },
      desc = "Search for current word",
    },
    {
      "<leader>fG",
      function()
        require("fzf-lua").grep_visual({ resume = true })
      end,
      mode = { "v" },
      desc = "Search for selection",
    },
    {
      "<leader>fu",
      function()
        require("fzf-lua").lgrep_curbuf({ resume = true })
      end,
      desc = "Search current bugger",
    },

    -- fzf lsp/treesitter helpers
    {
      "<leader>fr",
      function()
        require("fzf-lua").lsp_references({ resume = true })
      end,
      desc = "LSP references",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols({ resume = true })
      end,
      desc = "LSP document symbols",
    },
    {
      "<leader>fd",
      function()
        require("fzf-lua").diagnostics_document({ resume = true })
      end,
      desc = "Document diagnostics",
    },
    {
      "<leader>fD",
      function()
        require("fzf-lua").diagnostics_workspace({ resume = true })
      end,
      desc = "Workspace diagnostics",
    },
  },
  config = function(_, _)
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({
      fzf_opts = {
        ["--cycle"] = true,
      },
      grep = {
        rg_opts = table.concat({
          "--hidden",
          "--column",
          "--no-heading",
          "--color=always",
          "--smart-case",
          "--max-columns=4096 -e",
        }, " "),
      },
      oldfiles = {
        cwd_only = true,
        stat_file = true, -- verify file exists on disk
        include_current_session = true,
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
      files = {
        actions = {
          ["ctrl-x"] = fzf_lua.actions.file_split,
        },
      },
      buffers = {
        actions = {
          ["ctrl-x"] = fzf_lua.actions.file_split,
        },
      },
      keymap = {
        builtin = {
          true,
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          true,
          ["ctrl-q"] = "select-all+accept", -- to quickfix list
        },
      },
    })
  end,
}
