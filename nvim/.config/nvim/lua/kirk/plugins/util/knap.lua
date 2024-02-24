return {
  "frabjous/knap",
  cond = not vim.g.started_by_firenvim,
  ft = {
    "tex",
  },
  keys = {
    {
      "<leader>ko",
      function()
        require("knap").process_once()
      end,
      desc = "Knap - open",
    },
    {
      "<leader>kc",
      function()
        require("knap").close_viewer()
      end,
      desc = "Knap - close",
    },
  },
  init = function()
    local gknapsettings = {
      textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
      textopdfviewerrefresh = "none",
      textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
    }

    vim.g.knap_settings = gknapsettings
  end,
}
