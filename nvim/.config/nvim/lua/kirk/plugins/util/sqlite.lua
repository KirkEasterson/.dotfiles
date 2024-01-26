return {
  "kkharji/sqlite.lua",
  config = function(_, opts)
    os.execute("mkdir -p" .. vim.fn.stdpath("data") .. "/databases 2>&1 /dev/null")
  end,
}
