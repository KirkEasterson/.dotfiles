return {
  "chrisgrieser/nvim-recorder",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  },
  keys = {
    {
      "q",
      function()
        require("recorder").startStopRecording()
      end,
      mode = { "n" },
      desc = "Record macro",
    },
    {
      "Q",
      function()
        require("recorder").playMacro()
      end,
      mode = { "n" },
      desc = "Play macro",
    },
    {
      "<C-q>",
      function()
        require("recorder").switchSlot()
      end,
      mode = { "n" },
      desc = "Toggle macro slot",
    },
    {
      "cq",
      function()
        require("recorder").editMacro()
      end,
      mode = { "n" },
      desc = "Edit macro",
    },
    -- TODO: add mappings for 'delete' and 'yank' macro
  },
  opts = {
    lessNotifications = true,
  },
  init = function()
    vim.opt.shortmess:append("q")
  end,
  config = function(_, opts)
    require("recorder").setup(opts)

    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require("lualine").refresh({
          place = { "statusline" },
        })
      end,
      desc = "Refresh lualine when starting recording a macro",
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
          50,
          0,
          vim.schedule_wrap(function()
            require("lualine").refresh({
              place = { "statusline" },
            })
          end)
        )
      end,
      desc = "Refresh lualine when stopping recording a macro",
    })
  end,
}
