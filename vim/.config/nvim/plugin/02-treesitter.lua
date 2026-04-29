-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true

local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  desc = "Build treesitter",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and (kind == "update" or kind == "install") then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/folke/ts-comments.nvim",
})

vim.treesitter.language.register("markdown", "octo")

require("treesitter-context").setup({
  mode = "cursor",
  multiwindow = true,
  max_lines = 5,
  multiline_threshold = 1,
})

require("ts-comments").setup({})

require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["ak"] = "@block.outer",
      ["ik"] = "@block.inner",
    },
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
})

-- -- SELECT
-- function
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)

-- class
vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)

-- scope
vim.keymap.set({ "x", "o" }, "as", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end)

-- -- MOVE
-- dot repeat
vim.keymap.set(
  { "n", "x", "o" },
  "f",
  require("nvim-treesitter-textobjects.repeatable_move").builtin_f_expr,
  { expr = true }
)
vim.keymap.set(
  { "n", "x", "o" },
  "F",
  require("nvim-treesitter-textobjects.repeatable_move").builtin_F_expr,
  { expr = true }
)
vim.keymap.set(
  { "n", "x", "o" },
  "t",
  require("nvim-treesitter-textobjects.repeatable_move").builtin_t_expr,
  { expr = true }
)
vim.keymap.set(
  { "n", "x", "o" },
  "T",
  require("nvim-treesitter-textobjects.repeatable_move").builtin_T_expr,
  { expr = true }
)

-- function
vim.keymap.set({ "n", "x", "o" }, "[F", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[f", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]F", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)

-- class
vim.keymap.set({ "n", "x", "o" }, "[C", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]C", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)

-- conditional
vim.keymap.set({ "n", "x", "o" }, "[i", function()
  require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]i", function()
  require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end)

-- loop
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[o", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end)

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
  "gotmpl",
  "gowork",
  "hcl",
  "hjson",
  "html",
  "http",
  "ini",
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

vim.api.nvim_create_autocmd("User", {
  group = group,
  -- event = "VimEnter",
  once = true,
  desc = "Install treesitter parsers",
  callback = function()
    require("nvim-treesitter").install(parsers)
  end,
})

-- enable highlighting on FileType
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = parsers,
  desc = "Enable treesitter highlighting and indentation",
  callback = function()
    vim.treesitter.start()
  end,
})
