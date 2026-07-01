-- vim.schedule(function()
vim.pack.add({
  { src = "https://github.com/kevinhwang91/promise-async", version = vim.version.range("*") },
  { src = "https://github.com/kevinhwang91/nvim-ufo", version = vim.version.range("*") },
  { src = "https://github.com/lewis6991/gitsigns.nvim", version = vim.version.range("*") },
  { src = "https://github.com/luukvbaal/statuscol.nvim", version = vim.version.range("*") },
})

vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#888888" })

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "lsp" }
  end,
})

local builtin = require("statuscol.builtin")
require("statuscol").setup({
  setopt = true,
  relculright = true,
  bt_ignore = { "terminal" },
  ft_ignore = {
    "NeogitStatus",
    "NvimTree",
    "alpha",
    "dashboard",
    "help",
    "lazy",
    "mason",
    "null-ls-info",
    "packer",
    "scratch",
    "startify",
    "term",
    "toggleterm",
    "trouble",
  },
  segments = {
    { -- marks
      sign = {
        namespace = { "MarkSigns" },
        name = { ".*" },
        maxwidth = 2,
        colwidth = 1,
        auto = true,
      },
    },
    { -- diagnostics
      sign = {
        namespace = { "diagnostic" },
        maxwidth = 1,
        colwidth = 1,
        auto = false,
      },
      click = "v:lua.ScSa",
    },
    { -- testing
      sign = {
        namespace = { "neotest" },
        name = { ".*" },
        maxwidth = 1,
        colwidth = 1,
        auto = true,
      },
    },
    { -- debugging
      sign = {
        namespace = { "dap" },
        maxwidth = 1,
        colwidth = 1,
        auto = true,
      },
    },
    { -- line numbers
      text = { builtin.lnumfunc },
      click = "v:lua.ScLa",
    },
    { -- fold
      text = { " ", builtin.foldfunc },
      click = "v:lua.ScFa",
      sign = { foldclosed = true },
      hl = "FoldColumn",
    },
    { -- git signs
      hl = "GitSigns",
      sign = {
        wrap = true,
        maxwidth = 1,
        colwidth = 1,
        fillchar = "┃",
        fillcharhl = "",
        namespace = { "gitsign" },
      },
    },
  },
})
-- end)
