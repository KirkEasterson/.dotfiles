return {
  "glacambre/firenvim",
  -- enabled = false,
  cond = not not vim.g.started_by_firenvim, -- https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819214

  lazy = false,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
  opts = {
    globalSettings = {
      cmdlineTimeout = 3000,
    },
    localSettings = {
      [".*"] = {
        priority = 0,
        cmdline = "neovim",
        content = "text",
        selector = "textarea:not([readonly]):not([class=\"handsontableInput\"]), div[role=\"textbox\"]",
        takeover = "never",
      },
      [ [[.*notion\.so.*]] ] = {
        priority = 9,
        takeover = "never",
      },
      [ [[.*docs\.google\.com.*]] ] = {
        priority = 9,
        takeover = "never",
      },
    },
  },
  init = function()
    print("in firenvim init")
    vim.o.laststatus = 0
    vim.opt.cmdheight = 0
    vim.opt.confirm = false
    vim.opt.showtabline = 0
    vim.o.lines = 100
    vim.o.columns = 300
    vim.cmd.startinsert()

    local util = require("util")
    util.unmap("n", "<leader>q")
    util.map("n", "<leader>q", "<cmd>wq!<CR>", { desc = "Quit" })
    util.map("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<CR>", { desc = "Move focus back to page" })

    local firenvim_augroup = vim.api.nvim_create_augroup("FirenvimSettings", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "*",
      desc = "Set filetypes in firenvim",
      group = firenvim_augroup,
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname:match("github.com") then
          vim.cmd("set filetype=markdown")
          vim.cmd("colorscheme github")
        elseif bufname:match("slack.com") then
          vim.cmd("set filetype=markdown")
        elseif bufname:match("stackoverflow.com") then
          vim.cmd("set filetype=markdown")
        elseif bufname:match("stackexchange.com") then
          vim.cmd("set filetype=markdown")
        end
      end,
    })

    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      desc = "Sync firenvim buffer with page",
      group = firenvim_augroup,
      callback = function(_)
        if vim.g.timer_started == true then
          return
        end
        vim.g.timer_started = true
        vim.fn.timer_start(10000, function() -- ten seconds
          vim.cmd("silent! write")
          vim.g.timer_started = false
        end)
      end,
    })
  end,
  config = function(_, opts)
    vim.g.firenvim_config = opts
  end,
}
