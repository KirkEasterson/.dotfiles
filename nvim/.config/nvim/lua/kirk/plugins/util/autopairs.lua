return {
  "windwp/nvim-autopairs",
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  opts = {
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      go = { "string" },
    },
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    local rule = require("nvim-autopairs.rule")
    local ts_conds = require("nvim-autopairs.ts-conds")

    autopairs.setup(opts)
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
  end,
}
