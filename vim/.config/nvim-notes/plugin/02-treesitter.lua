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
})

local parsers = {
  "comment",
  "latex",
  "markdown",
  "markdown_inline",
  -- "norg",
  "regex",
  "typst",
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
