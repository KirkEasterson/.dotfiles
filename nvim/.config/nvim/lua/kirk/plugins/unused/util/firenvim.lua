return {
  "glacambre/firenvim",
  enabled = false,
  -- lazy = false,
  lazy = not vim.g.started_by_firenvim, -- https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819214
  -- version = "0.2.*",
  build = function()
    -- require("lazy").load({ plugins = "firenvim", wait = true })
    vim.fn["firenvim#install"](0)
  end,
  -- config = function(_, _)
  --   vim.o.laststatus = 0
  --   vim.opt.confirm = false
  --
  --   -- sync changes to the page
  --   vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  --     nested = true,
  --     callback = function()
  --       vim.cmd("silent! write")
  --     end,
  --   })
  -- end,
}
