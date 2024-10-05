return {
  "glacambre/firenvim",
  -- enabled = false,
  -- lazy = false,
  lazy = not vim.g.started_by_firenvim, -- https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819214
  -- version = "0.2.*",
  build = ":call firenvim#install(0)",
  config = function(_, _)
    vim.api.nvim_create_autocmd({ "UIEnter" }, {
      callback = function(_)
        local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
        if client ~= nil and client.name == "Firenvim" then
          -- don't show certain ui elements
          vim.o.laststatus = 0
          vim.opt.cmdheight = 0
          vim.opt.confirm = false
          vim.opt.showtabline = 0
          vim.cmd.startinsert()

          -- unmap save/quit
          local util = require("util")
          util.map("n", "<leader>w", "<Nop>")
          util.map("n", "<leader>q", "<Nop>")

          -- new save/quit mappings
          util.map("n", "<leader>w", "<cmd>silent! write<cr>", { desc = "Save file" })
          util.map("n", "<leader>q", vim.cmd.wq, { desc = "Close window" })

          -- interact with page
          vim.api.nvim_set_keymap(
            "n",
            "<Esc><Esc>",
            "<Cmd>call firenvim#focus_page()<CR>",
            { desc = "Move focus back to page" }
          )

          -- sync changes to the page
          vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
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

          -- website specific settings
          vim.api.nvim_create_autocmd({ "BufEnter" }, {
            callback = function()
              local bufname = vim.api.nvim_buf_get_name(0)
              if bufname:match("github.com") then
                vim.cmd("set filetype=markdown")
              elseif bufname:match("slack.com") then
                vim.cmd("set filetype=markdown")
              elseif bufname:match("stackoverflow.com") then
                vim.cmd("set filetype=markdown")
              elseif bufname:match("stackexchange.com") then
                vim.cmd("set filetype=markdown")
              end
            end,
          })
        end
      end,
    })
  end,
  init = function()
    if not vim.g.started_by_firenvim then
      -- regular nvim, exit early
      return
    end

    vim.g.firenvim_config = {
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
    }
  end,
}
