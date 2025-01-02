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
        cmdline = "neovim",
        content = "text",
        priority = 0,
        selector = "textarea:not([readonly]):not([class=\"handsontableInput\"]), div[role=\"textbox\"]",
        takeover = "always",
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
  config = function(_, opts)
    vim.g.firenvim_config = opts

    -- don't show certain ui elements
    vim.o.laststatus = 0
    vim.opt.cmdheight = 0
    vim.opt.confirm = false
    vim.opt.showtabline = 0
    vim.cmd.startinsert()

    -- overwrite save/quit mappings
    local util = require("util")
    util.map("n", "<leader>q", "wq!", { desc = "Close window" })

    -- interact with page
    vim.api.nvim_set_keymap(
      "n",
      "<Esc><Esc>",
      "<Cmd>call firenvim#focus_page()<CR>",
      { desc = "Move focus back to page" }
    )

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "*",
      desc = "Set filetypes in firenvim",
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

    -- sync changes to the page
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      desc = "Sync firenvim buffer with page",
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
}
