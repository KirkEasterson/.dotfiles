return {
  "kndndrj/nvim-dbee",
  enabled = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "Dbee",
  },
  build = function()
    require("dbee").install()
  end,
  keys = {
    {
      "<leader>db",
      function()
        require("dbee").toggle()
      end,
      desc = "Toggle dbee UI",
    },
  },
  opts = {},
  config = function(_, opts)
    require("dbee").setup(opts)
    require("dbee.sources").FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json")
  end,
}
