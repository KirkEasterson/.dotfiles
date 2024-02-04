return {
  "kkharji/sqlite.lua",
  config = function(_, opts)
    os.execute("mkdir -p " .. vim.fn.stdpath("data") .. "/databases")
  end,
}
