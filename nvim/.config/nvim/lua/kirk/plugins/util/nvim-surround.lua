return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  keys = {
    { "ys", mode = { "n" } },
    { "ds", mode = { "n" } },
    { "cs", mode = { "n" } },
    { "S", mode = { "v" } },
    { "gS", mode = { "x" } },
  },
  opts = {
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
  },
}
