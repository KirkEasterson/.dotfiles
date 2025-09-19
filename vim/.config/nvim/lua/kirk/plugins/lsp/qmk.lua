return {
  "codethread/qmk.nvim",
  cmd = "QMKFormat",
  opts = {
    name = "chocofi",
    variant = "zmk",
    comment_preview = {
      position = "top",
      keymap_overrides = {
        ["&none"] = "",
        ["&trans"] = "…",
      },
      symbols = {
        space = " ",
        horz = "─",
        vert = "│",
        tl = "┌",
        tm = "┬",
        tr = "┐",
        ml = "├",
        mm = "┼",
        mr = "┤",
        bl = "└",
        bm = "┴",
        br = "┘",
      },
    },
    layout = {
      "x x x x x _ _ _ x x x x x",
      "x x x x x _ _ _ x x x x x",
      "x x x x x _ _ _ x x x x x",
      "_ _ _ x x x _ x x x _ _ _",
    },
  },
}
