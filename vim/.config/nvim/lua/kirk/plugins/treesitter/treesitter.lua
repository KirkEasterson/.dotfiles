return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  version = false,
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSDisable",
    "TSEnable",
    "TSModuleInfo",
  },
  -- opts = {
  --   modules = {},
  --   auto_install = true,
  --   sync_install = false,
  --   indent = {
  --     enable = true,
  --   },
  --   highlight = {
  --     enable = true,
  --     additional_vim_regex_highlighting = false,
  --     disable = function(_, buf)
  --       local max_filesize = 100 * 1024 -- 100 KB
  --       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  --       if ok and stats and stats.size > max_filesize then
  --         return true
  --       end
  --     end,
  --   },
  --   incremental_selection = {
  --     enable = true,
  --     keymaps = {
  --       init_selection = "gnn", -- set to `false` to disable one of the mappings
  --       node_incremental = "grn",
  --       scope_incremental = "grc",
  --       node_decremental = "grm",
  --     },
  --   },
  -- },
  config = function()
    local ts = require("nvim-treesitter")
    ts.install({
      "bash",
      "bibtex",
      "c",
      "c_sharp",
      "cmake",
      "comment",
      "commonlisp",
      "cpp",
      "css",
      "csv",
      "devicetree",
      "diff",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "hcl",
      "hjson",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "luau",
      "make",
      "markdown",
      "markdown_inline",
      "norg",
      "ocaml",
      "ocaml_interface",
      "odin",
      "prisma",
      "proto",
      "python",
      "query",
      "regex",
      "rust",
      "scss",
      "svelte",
      "sxhkdrc",
      "terraform",
      "todotxt",
      "toml",
      "tsx",
      "tsv",
      "typescript",
      "typst",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      "zig",
    })

    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
    local ignore_filetypes = {
      "checkhealth",
      "lazy",
      "mason",
      "snacks_dashboard",
      "snacks_notif",
      "snacks_win",
    }

    -- Auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      desc = "Enable treesitter highlighting and indentation",
      callback = function(event)
        if vim.tbl_contains(ignore_filetypes, event.match) then
          return
        end

        local lang = vim.treesitter.language.get_lang(event.match) or event.match
        local buf = event.buf

        -- Start highlighting immediately (works if parser exists)
        pcall(vim.treesitter.start, buf, lang)

        -- Enable treesitter indentation
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Install missing parsers (async, no-op if already installed)
        ts.install({ lang })
      end,
    })
  end,
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
