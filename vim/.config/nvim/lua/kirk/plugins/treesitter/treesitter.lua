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

    -- track buffers waiting for parser installation: { lang = { [buf] = true, ... } }
    local waiting_buffers = {}
    -- track languages currently being installed to avoid duplicate install tasks
    local installing_langs = {}

    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

    -- install core parsers after lazy.nvim finishes loading all plugins
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "LazyDone",
      once = true,
      desc = "Install core treesitter parsers",
      callback = function()
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
      end,
    })

    local ignore_filetypes = {
      "checkhealth",
      "lazy",
      "mason",
      "snacks_dashboard",
      "snacks_notif",
      "snacks_win",
    }

    -- auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      desc = "Enable treesitter highlighting and indentation",
      callback = function(event)
        if vim.tbl_contains(ignore_filetypes, event.match) then
          return
        end

        local lang = vim.treesitter.language.get_lang(event.match) or event.match
        local buf = event.buf

        if not enable_treesitter(buf, lang) then
          -- Parser not available, queue buffer (set handles duplicates)
          waiting_buffers[lang] = waiting_buffers[lang] or {}
          waiting_buffers[lang][buf] = true

          -- Only start install if not already in progress
          if not installing_langs[lang] then
            installing_langs[lang] = true
            local task = ts.install({ lang })

            -- Register callback for when installation completes
            if task and task.await then
              task:await(function()
                vim.schedule(function()
                  installing_langs[lang] = nil

                  -- Enable treesitter on all waiting buffers for this language
                  local buffers = waiting_buffers[lang]
                  if buffers then
                    for b in pairs(buffers) do
                      enable_treesitter(b, lang)
                    end
                    waiting_buffers[lang] = nil
                  end
                end)
              end)
            else
              -- Fallback: clear state if task doesn't support await
              installing_langs[lang] = nil
              waiting_buffers[lang] = nil
            end
          end
        end
      end,
    })

    -- clean up waiting buffers when buffer is deleted
    vim.api.nvim_create_autocmd("BufDelete", {
      group = group,
      desc = "Clean up treesitter waiting buffers",
      callback = function(event)
        for lang, buffers in pairs(waiting_buffers) do
          buffers[event.buf] = nil
          if next(buffers) == nil then
            waiting_buffers[lang] = nil
          end
        end
      end,
    })
  end,
  init = function()
    vim.treesitter.language.register("markdown", "octo")
  end,
}
