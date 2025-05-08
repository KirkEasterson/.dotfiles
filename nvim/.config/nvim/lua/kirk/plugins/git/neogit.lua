return {
  "NeogitOrg/neogit",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "rmagatti/auto-session",
    "folke/snacks.nvim",
  },
  cmd = "Neogit",
  keys = {
    {
      "<leader>gg",
      function()
        -- TODO: make this toggle neogit
        require("neogit").open()
      end,
      desc = "Neogit",
    },
  },
  opts = {
    auto_show_console = false,
    console_timeout = 5000,
    disable_commit_confirmation = true,
    disable_hint = true,
    disable_insert_on_commit = false, -- start commits in insert mode
    graph_style = "unicode",
    use_per_project_settings = false,
    -- telescope_sorter = function()
    --   return require("telescope").extensions.fzf.native_fzf_sorter()
    -- end,
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
    integrations = {
      snacks = true,
      diffview = true,
      fzf_lua = false,
      telescope = false,
    },

    -- https://github.com/NeogitOrg/neogit/issues/1377#issuecomment-2174427660
    filewatcher = { enabled = true },
  },
  config = function(_, opts)
    require("neogit").setup(opts)

    local neogit_group = vim.api.nvim_create_augroup("UserNeogitEvents", { clear = true })
    vim.api.nvim_create_autocmd({ "User" }, {
      desc = "Load session for checked out branch",
      pattern = "NeogitBranchCheckout",
      group = neogit_group,
      callback = function()
        local autosession = require("auto-session")
        if not autosession.session_exists_for_cwd() then
          autosession.SaveSession(nil, false)
          return
        end

        local neogit = require("neogit")
        neogit.close()
        vim.cmd([[%bd!]])
        autosession.RestoreSession("")
        neogit.open()
      end,
    })
  end,
}
