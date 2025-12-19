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
      "regex",
      "rust",
      "sxhkdrc",
      "terraform",
      "todotxt",
      "toml",
      "tsv",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zig",
    })
  end,
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
