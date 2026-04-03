vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/nvim-treesitter/nvim-treesitter",

  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/kylechui/nvim-surround",
})

local autopairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local ts_conds = require("nvim-autopairs.ts-conds")

autopairs.setup({
  enable_check_bracket_line = true,
  ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    go = { "string" },
  },
})
autopairs.add_rules({
  rule("<", ">", {
    "astro",
    "fsharp",
    "glimmer",
    "handlebars",
    "hbs",
    "html",
    "javascript",
    "javascriptreact",
    "jsx",
    "markdown",
    "ocaml",
    "php",
    "rescript",
    "svelte",
    "tsx",
    "typescript",
    "typescriptreact",
    "vue",
    "xml",
  }),
  -- }):with_pair(ts_conds.is_ts_node({ "Type" })),

  -- arrow key in js/ts `=>`
  rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
    :use_regex(true)
    :set_end_pair_length(2),
})

require("nvim-surround").setup({
  -- flip which ones add a space
  surrounds = {
    ["("] = {
      add = { "(", ")" },
    },
    [")"] = {
      add = { "( ", " )" },
    },
    ["{"] = {
      add = { "{", "}" },
    },
    ["}"] = {
      add = { "{ ", " }" },
    },
    ["<"] = {
      add = { "<", ">" },
    },
    [">"] = {
      add = { "< ", " >" },
    },
    ["["] = {
      add = { "[", "]" },
    },
    ["]"] = {
      add = { "[ ", " ]" },
    },
  },
})
