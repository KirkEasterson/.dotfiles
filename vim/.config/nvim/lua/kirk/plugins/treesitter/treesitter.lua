-- much code was taken form here: https://github.com/ThorstenRhau/neovim/blob/3474f2aff6026db5a684e6999f51dfc6e7ee30c6/lua/optional/treesitter.lua

local function enable_treesitter(buf, lang)
  if not vim.api.nvim_buf_is_valid(buf) then
    return false
  end

  local ok = pcall(vim.treesitter.start, buf, lang)
  if not ok then
    return false
  end

  -- set treesitter indentation (buffer-local)
  vim.api.nvim_set_option_value("indentexpr", "v:lua.require'nvim-treesitter'.indentexpr()", { buf = buf })
  -- set treesitter folding for all windows displaying this buffer (window-local)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == buf and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_option_value("foldmethod", "expr", { win = win })
      vim.api.nvim_set_option_value("foldexpr", "v:lua.vim.treesitter.foldexpr()", { win = win })
    end
  end

  return true
end

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
  config = function()
    local ts = require("nvim-treesitter")
    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
    local parsers = {
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
      -- "jsonc",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "luau",
      "make",
      "markdown",
      "markdown_inline",
      -- "norg",
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
    }

    -- install core parsers after lazy.nvim finishes loading all plugins
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "LazyDone",
      once = true,
      desc = "Install core treesitter parsers",
      callback = function()
        ts.install(parsers)
      end,
    })

    -- auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = parsers,
      desc = "Enable treesitter highlighting and indentation",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
