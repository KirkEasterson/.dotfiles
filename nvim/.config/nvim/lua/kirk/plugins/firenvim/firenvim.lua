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
              vim.fn.timer_start(10000, function()
                vim.g.timer_started = false
                vim.cmd("silent! write")
              end)
            end,
          })

          -- website specific settings
          vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = "github.com_*.txt",
            command = "set filetype=markdown",
          })
        end
      end,
    })
  end,
  init = function()
    if not not vim.g.started_by_firenvim then
      vim.g.firenvim_config = {
        globalSettings = {
          cmdlineTimeout = 3000,
        },
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
            content = "text",
            priority = 0,
            selector = "textarea",
            takeover = "always",
          },
        },
      }
    end
  end,
}
